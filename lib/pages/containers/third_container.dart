import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slb/controllers/input_form_page_controller.dart';

class ThirdContainer extends StatelessWidget {
  const ThirdContainer({super.key});

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
        height: 325,
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
                        'Q3.',
                        style: TextStyle(
                          fontSize: 31,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text(
                          '지금 학교에서 몇 학점 듣고 있나요?',
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
                        '(숫자만 입력해주세요!)',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '전공',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                      TextField(
                        controller: controller.majorTextEditingController,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        decoration: InputDecoration(
                            hintText: '예시: 12',
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
                          controller.majorPageInputValue.value = value;
                        },
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '교양',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                        TextField(
                          controller: controller.generalTextEditingController,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          decoration: InputDecoration(
                              hintText: '예시: 6',
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
                            controller.generalPageInputValue.value = value;
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

}