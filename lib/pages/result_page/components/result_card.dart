// lib/components/result_card.dart

import 'package:flutter/material.dart';
import 'stats_slider_section.dart';

class ResultCard extends StatelessWidget {
  final GlobalKey captureKey;
  final String resultType;
  final String imagePath;

  const ResultCard({
    super.key,
    required this.captureKey,
    required this.resultType,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: captureKey,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, 3),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
              child: Text(
                '당신의 스라벨 유형은',
                style: TextStyle(fontSize: 20, color: Colors.black87),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(fontSize: 30, color: Colors.black87, fontFamily: 'YourAppFont'), // 폰트 일관성을 위해 설정
                  children: <TextSpan>[
                    TextSpan(
                      text: resultType,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const TextSpan(text: ' 입니다!', style: TextStyle(fontSize: 15)),
                  ],
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            // 통계 슬라이더 섹션을 별도 위젯으로 분리
            const StatsSliderSection(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}