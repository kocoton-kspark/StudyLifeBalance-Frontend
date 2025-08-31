import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/input_form_page_controller.dart';


class EighthContainer extends StatelessWidget {
  const EighthContainer({super.key});

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
                        'Q8.',
                        style: TextStyle(
                          fontSize: 31,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text(
                          '갑작스러운 휴강, 내가 할 것은?',
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
                      title: Text('어차피 공부할 시간이야, 밀린 과제나 좀 하자'),
                      value: '어차피 공부할 시간이야, 밀린 과제나 좀 하자',
                      activeColor: Color(0xFF226BEF),
                      groupValue: controller.eighthSelectedValue.value,
                      onChanged: (value) => controller.selectEighth(value)
                  ),
                  RadioListTile<String>(
                      title: Text('휴강은 공부할 시간 아니야, 일단 좀 쉬자'),
                      value: '휴강은 공부할 시간 아니야, 일단 좀 쉬자',
                      activeColor: Color(0xFF226BEF),
                      groupValue: controller.eighthSelectedValue.value,
                      onChanged: (value) => controller.selectEighth(value)
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