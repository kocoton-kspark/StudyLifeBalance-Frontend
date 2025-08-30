import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/input_form_page_controller.dart';

class FourthContainer extends StatelessWidget {
  const FourthContainer({super.key});

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
        height: 250,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    'Q4.',
                    style: TextStyle(
                      fontSize: 31,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(
                      '추가적인 대외활동을 하고 계신가요?',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                ],
              ),
              Obx(() => Column(
                children: [
                  RadioListTile<String>(
                    title: Text('네'),
                    value: '네',
                    activeColor: Color(0xFF226BEF),
                    groupValue: controller.activitySelectedValue.value,
                    onChanged: (value) => controller.selectActivity(value)
                  ),
                  RadioListTile<String>(
                    title: Text('아니오'),
                    value: '아니오',
                      activeColor: Color(0xFF226BEF),
                    groupValue: controller.activitySelectedValue.value,
                      onChanged: (value) => controller.selectActivity(value)
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