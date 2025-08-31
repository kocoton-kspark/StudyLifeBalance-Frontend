import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/input_form_page_controller.dart';


class SeventhContainer extends StatelessWidget {
  const SeventhContainer({super.key});

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
                        'Q7.',
                        style: TextStyle(
                          fontSize: 31,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text(
                          '공강 없이 달린 지금 당장 가고 싶은 곳은?',
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
                      title: Text('폭신 폭신한 침대 속'),
                      value: '폭신 폭신한 침대 속',
                      activeColor: Color(0xFF226BEF),
                      groupValue: controller.seventhSelectedValue.value,
                      onChanged: (value) => controller.selectSeventh(value)
                  ),
                  RadioListTile<String>(
                      title: Text('선선한 바람이 부는 운동장'),
                      value: '선선한 바람이 부는 운동장',
                      activeColor: Color(0xFF226BEF),
                      groupValue: controller.seventhSelectedValue.value,
                      onChanged: (value) => controller.selectSeventh(value)
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