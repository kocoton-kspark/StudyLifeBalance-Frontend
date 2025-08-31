import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/input_form_page_controller.dart';


class FifthContainer extends StatelessWidget {
  const FifthContainer({super.key});

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
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        'Q5.',
                        style: TextStyle(
                          fontSize: 31,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text(
                          '과제 제출 하루 전 어느곳에서',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        '과제를 마무리할까요?',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Obx(() => Column(
                children: [
                  RadioListTile<String>(
                      title: Text('조용하고 아늑한 집'),
                      value: '조용하고 아늑한 집',
                      activeColor: Color(0xFF226BEF),
                      groupValue: controller.fifthSelectedValue.value,
                      onChanged: (value) => controller.selectFifth(value)
                  ),
                  RadioListTile<String>(
                      title: Text('잔잔한 음악이 나오는 카페'),
                      value: '잔잔한 음악이 나오는 카페',
                      activeColor: Color(0xFF226BEF),
                      groupValue: controller.fifthSelectedValue.value,
                      onChanged: (value) => controller.selectFifth(value)
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