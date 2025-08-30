import 'package:flutter/material.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 24.0), // ✅ 여기에 상단 여백을 추가했습니다.
              const Text(
                'STUDY AND\nLIFE BALANCE',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 48),
              _buildSocialIcon(
                Image.asset('assets/images/app_icon.png', width: 400, height: 400),
                    () {
                },
              ),

              const SizedBox(height: 48),

              // 설명 텍스트
              const Text(
                '혹시 열심히 와 잘을 혼동하고 있지는 않나요?\n지금 당신의 스터디와 라이프의 균형을 분석해보세요!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black87,
                  height: 1.5,
                ),
              ),
              const Spacer(flex: 2),

              // '나의 스라밸 분석하기' 버튼
              ElevatedButton(
                onPressed: () {
                  // TODO: 버튼 클릭 시 실행될 로직을 여기에 작성하세요.
                  print('분석하기 버튼 클릭됨!');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF226BEF), // 버튼 배경색
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  '나의 스라밸 분석하기',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Spacer(flex: 1),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialIcon(Widget icon, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(

          ),
          child: icon,
        ),
      ),
    );
  }
}