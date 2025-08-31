import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/input_form_page_controller.dart';
import '../home_page/home_page.dart';
import 'components/sleep_slider_section.dart';


class RecommendationPage extends StatelessWidget {
  const RecommendationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<InputFormPageController>();
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text(
          '추천 스라밸',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Obx(() => ListView(
                children: [
                  _buildInfoCard(
                    title: '유형 자세히 설명',
                    description: controller.description.value,
                  ),
                  const SizedBox(height: 16),
                  _buildInfoCard(
                    title: '공부를 더 잘하는 법?',
                    description: controller.studyRecommend.value,
                  ),
                  const SizedBox(height: 16),
                  _buildInfoCard(
                    title: '더 잘 쉬는 법?',
                    description: controller.restRecommend.value,
                  ),
                  const SizedBox(height: 16),
                  // '더 잘 쉬는 법?' 카드 안에 SleepSliderSection을 포함시킵니다.
                  _buildInfoCard(
                    title: '나의 수면 밸런스는?',
                    description: '',
                    additionalContent: const SleepSliderSection(),
                  ),
                ],
              )),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                controller.resetState();
                Get.offAll(() => HomePage());
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 55),
                backgroundColor: Color(0xFF226BEF),
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

  // 추가 위젯을 받을 수 있도록 수정된 _buildInfoCard 함수
  Widget _buildInfoCard({
    required String title,
    required String description,
    Widget? additionalContent, // 선택적으로 받을 추가 위젯
  }) {
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
          // additionalContent가 null이 아닐 경우에만 위젯을 추가합니다.
          if (additionalContent != null) ...[
            const SizedBox(height: 20), // 설명과 추가 콘텐츠 사이의 간격
            additionalContent,
          ],
        ],
      ),
    );
  }
}