import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slb/controllers/input_form_page_controller.dart';
import 'package:slb/dummy/sleep_time_per_grade.dart';

class NoThumbSliderShape extends SliderComponentShape {
  const NoThumbSliderShape();

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) => Size.zero;

  @override
  void paint(PaintingContext context, Offset center,
      {
        required Animation<double> activationAnimation,
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


class SleepSliderSection extends StatelessWidget {
  const SleepSliderSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<InputFormPageController>();
    final double missingSleepHour = controller.sleepTime.value - 8;
    final bool isMissSleeping = missingSleepHour < 0;
    const double maxSleepHours = 12.0;

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
            _buildSliderRow('나의 수면 시간', '${controller.sleepTime.value.round()}시간', controller.sleepTime.value, maxSleepHours, Colors.blue, Color(0xFFF9F9F9)),
            const SizedBox(height: 10),
            _buildSliderRow('권장 수면 시간', '8시간', 8.0, maxSleepHours, Colors.blue, Color(0xFFF9F9F9)),
            const SizedBox(height: 10),
            isMissSleeping
              ? _buildSliderRow('부족한 수면 시간', '${missingSleepHour.round().abs()}시간', missingSleepHour.abs(), maxSleepHours, Colors.red, Color(0xFFF9F9F9))
              : _buildSliderRow('초과한 수면 시간', '${missingSleepHour.round().abs()}시간', missingSleepHour.abs(), maxSleepHours, Colors.red, Color(0xFFF9F9F9)),
            const SizedBox(height: 10),
            _buildSliderRow('${controller.gradeSelectedValue.value}학년 평균 수면 시간', '${sleepTimePerGrade[controller.gradeSelectedValue.value]}시간', sleepTimePerGrade[controller.gradeSelectedValue.value]!, maxSleepHours, Colors.blue, Color(0xFFF9F9F9)),
          ],
        ),
      ),
    );
  }

  // 👇 [수정] _buildSliderRow 헬퍼 메서드를 시간 표시용으로 변경합니다.
  Widget _buildSliderRow(
      String label,           // 슬라이더 좌측에 표시될 이름
      String valueText,       // 슬라이더 우측에 표시될 텍스트 (예: "7.5시간")
      double value,           // 실제 데이터 값 (슬라이더 위치)
      double maxValue,        // 슬라이더가 나타내는 최대 값
      Color activeColor,
      Color inactiveColor) {

    // 퍼센트 계산 로직을 제거합니다.

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            // 우측에 valueText를 표시합니다.
            Text(valueText,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: activeColor)),
          ],
        ),
        const SizedBox(height: 4),
        Slider(
          value: value,
          min: 0, // 최솟값은 0
          max: maxValue, // 최댓값 설정
          onChanged: (newValue) {}, // 상호작용이 없으므로 빈 함수
          activeColor: activeColor,
          inactiveColor: inactiveColor,
        ),
      ],
    );
  }
}