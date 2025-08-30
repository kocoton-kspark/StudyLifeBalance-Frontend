import 'package:flutter/material.dart';
import 'index.dart'; // 👈 1. index.dart 파일을 import 해주세요. (경로는 실제 위치에 맞게 수정)

class RecommendationPage extends StatelessWidget {
  const RecommendationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('추천 스라밸'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  _buildInfoCard(
                    title: '유형 자세히 설명',
                    description: '설명설명설명',
                  ),
                  const SizedBox(height: 16),
                  _buildInfoCard(
                    title: '공부를 더 잘하는 법?',
                    description: '지피티 설명',
                  ),
                  const SizedBox(height: 16),
                  _buildInfoCard(
                    title: '더 잘 쉬는 법?',
                    description: '지피티 설명',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // 👇 2. 이 부분을 수정했습니다.
                // 기존의 Navigator.pop(context); 대신 아래 코드를 사용합니다.
                // 모든 이전 화면을 제거하고 IndexPage로 이동합니다.
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const IndexPage()),
                      (Route<dynamic> route) => false,
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 55),
                backgroundColor: Colors.blue.shade600,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 5,
              ),
              child: const Text(
                '홈으로',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard({required String title, required String description}) {
    // ... (이 부분은 수정사항이 없습니다)
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}