import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:media_store_plus/media_store_plus.dart';

import '../../des.dart';
import 'components/recommendation_button.dart';
import 'components/result_card.dart';
import 'components/social_share_bar.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  final GlobalKey _captureKey = GlobalKey();

  Future<void> _captureAndSaveToGallery() async {
    try {
      // 1) 위젯 캡처
      final boundary = _captureKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      final ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      final pngBytes = byteData!.buffer.asUint8List();

      // 2) 임시 파일 저장
      final dir = await getTemporaryDirectory();
      final filePath = '${dir.path}/slabel_result_${DateTime.now().millisecondsSinceEpoch}.png';
      final file = File(filePath);
      await file.writeAsBytes(pngBytes);

      // 3) MediaStore를 통해 갤러리에 저장 (Android 전용)
      if (Platform.isAndroid) {
        final mediaStore = MediaStore();
        final savedEntry = await mediaStore.saveFile(
          tempFilePath: file.path,              // ✅ 최신 API: tempFilePath 사용
          dirType: DirType.photo,               // 사진 카테고리
          dirName: DirName.pictures,              // ✅ DirName 타입으로 전달
        );

        if (savedEntry != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('갤러리에 저장되었습니다. (앨범: SLB)')),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('저장에 실패했습니다.')),
          );
        }
      } else if (Platform.isIOS) {
        // iOS는 MediaStore가 없으므로, 필요 시 photo_manager 등으로 별도 구현
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('현재 iOS 저장은 미구현 상태입니다.')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('오류 발생: $e')),
      );
    }
  }

  void _navigateToRecommendation() {
    Get.to(() => RecommendationPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBar(
        title: const Text(
            '실행 결과',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 1. 결과 카드 위젯
              ResultCard(
                captureKey: _captureKey,
                resultType: '궁궐 탈출 세종대왕',
                imagePath: 'assets/images/sejong.png',
              ),
              const SizedBox(height: 30),
              // 2. 소셜 공유 바 위젯
              SocialShareBar(
                onDownload: _captureAndSaveToGallery,
                onInstagram: () => print('인스타그램 공유'),
                onKakao: () => print('카카오 공유'),
              ),
              const SizedBox(height: 30),
              // 3. 추천 페이지 이동 버튼 위젯
              RecommendationButton(
                onPressed: _navigateToRecommendation,
              ),
            ],
          ),
        ),
      ),
    );
  }
}