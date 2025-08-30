// lib/components/social_share_bar.dart

import 'package:flutter/material.dart';

class SocialShareBar extends StatelessWidget {
  final VoidCallback onInstagram;
  final VoidCallback onKakao;
  final VoidCallback onDownload;

  const SocialShareBar({
    super.key,
    required this.onInstagram,
    required this.onKakao,
    required this.onDownload,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildSocialIcon(
              Image.asset('assets/images/instagram_icon.png', width: 35, height: 35),
              onInstagram,
            ),
            _buildSocialIcon(
              Image.asset('assets/images/kakao_icon.png', width: 35, height: 35),
              onKakao,
            ),
            _buildSocialIcon(
              Icon(Icons.save_alt, size: 35, color: Colors.grey[700]),
              onDownload,
            ),
          ],
        ),
      ),
    );
  }

  // 이 위젯에서만 사용하는 헬퍼 메서드
  Widget _buildSocialIcon(Widget iconWidget, VoidCallback onPressed) {
    return IconButton(
      iconSize: 40,
      icon: iconWidget,
      onPressed: onPressed,
      splashRadius: 28,
    );
  }
}