// lib/components/stats_slider_section.dart

import 'package:flutter/material.dart';

// Thumb을 없애기 위한 커스텀 Shape
class NoThumbSliderShape extends SliderComponentShape {
  const NoThumbSliderShape();

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) => Size.zero;

  @override
  void paint(PaintingContext context, Offset center,
      {required Animation<double> activationAnimation,
        required Animation<double> enableAnimation,
        required bool isDiscrete,
        required TextPainter labelPainter,
        required RenderBox parentBox,
        required SliderThemeData sliderTheme,
        required TextDirection textDirection,
        required double value,
        required double textScaleFactor,
        required Size sizeWithOverflow}) {}
}


class StatsSliderSection extends StatelessWidget {
  const StatsSliderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        thumbShape: const NoThumbSliderShape(),
        overlayShape: SliderComponentShape.noOverlay,
        trackShape: const RectangularSliderTrackShape(),
        trackHeight: 5.0,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            _buildSliderRow('전공', '교양', 0.4, Colors.blue, Colors.red),
            const SizedBox(height: 10),
            _buildSliderRow('공부', '휴식', 0.7, Colors.blue, Colors.red),
            const SizedBox(height: 10),
            _buildSliderRow('활동', '비활동', 0.5, Colors.blue, Colors.red),
          ],
        ),
      ),
    );
  }

  // 이 위젯에서만 사용하는 헬퍼 메서드는 이곳으로 이동
  Widget _buildSliderRow(String leftLabel, String rightLabel, double value,
      Color activeColor, Color inactiveColor) {
    int leftPercentage = (value * 100).round();
    int rightPercentage = 100 - leftPercentage;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(leftLabel,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Text(rightLabel,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            Text(
              '$leftPercentage%',
              style: TextStyle(
                  fontSize: 14, color: activeColor, fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Slider(
                value: value,
                onChanged: (newValue) {}, // 상호작용이 없으므로 빈 함수
                activeColor: activeColor,
                inactiveColor: inactiveColor,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              '$rightPercentage%',
              style: TextStyle(
                  fontSize: 14, color: inactiveColor, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}