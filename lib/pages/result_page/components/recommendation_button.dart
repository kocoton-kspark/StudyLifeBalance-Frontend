// lib/components/recommendation_button.dart

import 'package:flutter/material.dart';

class RecommendationButton extends StatelessWidget {
  final VoidCallback onPressed;

  const RecommendationButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 55),
        backgroundColor: const Color(0xFF226BEF),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 5,
      ),
      child: const Text(
        '나의 추천 스라벨',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}