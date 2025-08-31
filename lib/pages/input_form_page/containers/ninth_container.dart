import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/input_form_page_controller.dart';


class NinthContainer extends StatelessWidget {
  const NinthContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<InputFormPageController>();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 1,
                blurRadius: 10,
                offset: Offset(0, 3),
              )
            ]
        ),
        height: 225,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        'Q9.',
                        style: TextStyle(
                          fontSize: 31,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text(
                          '하루의 평균 수면 시간은 얼마나 되나요?',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                          '평균 수면 시간: ',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Obx(() => Text(
                          controller.sleepTime.value.round().toString(),
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                    ],
                  ),
                  Obx((() => SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Color(0xFF226BEF),
                      inactiveTrackColor: Colors.grey[200],
                      trackHeight: 6,
                      thumbColor: Color(0xFF226BEF),
                      valueIndicatorColor: Color(0xFF226BEF),
                    ),
                    child: Slider(
                      value: controller.sleepTime.value,
                      min: 0,
                      max: 24,
                      divisions: 24,
                      label: controller.sleepTime.round().toString(),
                      onChanged: (double value) {
                        controller.sleepTime.value = value;
                      },
                    ),
                  ))),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}