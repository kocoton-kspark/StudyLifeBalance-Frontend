import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/input_form_page_controller.dart';

class SixthContainer extends StatelessWidget {
  const SixthContainer({super.key});

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
                        'Q6.',
                        style: TextStyle(
                          fontSize: 31,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text(
                          '갑작스러운 방학이 찾아온다면 당신은?',
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
              Obx(() => Column(
                children: [
                  RadioListTile<String>(
                      title: Text('개강하면 까먹을것 같아... 복습 좀만...'),
                      value: '개강하면 까먹을것 같아... 복습 좀만...',
                      activeColor: Color(0xFF226BEF),
                      groupValue: controller.sixthSelectedValue.value,
                      onChanged: (value) => controller.selectSixth(value)
                  ),
                  RadioListTile<String>(
                      title: Text('몰라! 일단 바다로 떠나자~'),
                      value: '몰라! 일단 바다로 떠나자~',
                      activeColor: Color(0xFF226BEF),
                      groupValue: controller.sixthSelectedValue.value,
                      onChanged: (value) => controller.selectSixth(value)
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}