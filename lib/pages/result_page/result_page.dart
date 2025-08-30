// lib/main.dart

import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:html' as html;
import 'dart:convert';

import 'components/recommendation_button.dart';
import 'components/result_card.dart';
import 'components/social_share_bar.dart';

// 분리된 위젯들을 import 합니다.

// des.dart와 RecommendationPage는 예시로 남겨둡니다.
// import 'des.dart';
// class RecommendationPage extends StatelessWidget { ... }

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  final GlobalKey _captureKey = GlobalKey();

  // 이미지 다운로드 기능은 상태를 관리하는 이곳에 그대로 둡니다.
  Future<void> _captureAndDownloadImage() async {
    try {
      RenderRepaintBoundary boundary =
      _captureKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      final base64 = base64Encode(pngBytes);
      html.AnchorElement(href: 'data:application/octet-stream;base64,$base64')
        ..setAttribute("download", "slabel_result.png")
        ..click();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('이미지 다운로드를 시작합니다.')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('오류 발생: ${e.toString()}')),
      );
    }
  }

  void _navigateToRecommendation() {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => const RecommendationPage()),
    // );
    print("추천 페이지로 이동");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBar(
        title: const Text('실행 결과'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
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
                onDownload: _captureAndDownloadImage,
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