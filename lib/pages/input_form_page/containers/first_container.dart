import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slb/controllers/input_form_page_controller.dart';

class FirstContainer extends StatelessWidget {
  const FirstContainer({super.key});

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
        height: 175,
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
                    'Q1.',
                    style: TextStyle(
                      fontSize: 31,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(
                      '대학교 이름을 입력해주세요!',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                ],
              ),
              TextField(
                controller: controller.firstPageTextEditingController,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                    hintText: '예시: 국민대학교',
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Color(0xFFD9D9D9),
                      fontSize: 16,
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)
                    ),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFD9D9D9))
                    )
                ),
                onChanged: (value) {
                  controller.firstPageInputValue.value = value;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

}