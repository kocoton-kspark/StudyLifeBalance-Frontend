import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:get/get.dart';

import '../../controllers/input_form_page_controller.dart';

class SecondContainer extends StatelessWidget {
  const SecondContainer({super.key});
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
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    'Q2.',
                    style: TextStyle(
                      fontSize: 31,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(
                      '단과대와 학년을 입력해주세요!',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DropdownButtonHideUnderline(
                      child: DropdownButton2<String>(
                        isExpanded: true,
                        hint: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text('단과대 선택'),
                        ),
                        items: controller.collegeList
                            .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(item, style: TextStyle(fontSize: 14)),
                          ),
                        ))
                            .toList(),
                        value: controller.collegeSelectedValue.value,
                        onChanged: (value) {
                          controller.collegeSelectedValue.value = value;
                        },
                        buttonStyleData: ButtonStyleData(
                          height: 50,
                          width: 180,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(color: Colors.black26),
                            color: Colors.white,
                          ),
                        ),
                        dropdownStyleData: DropdownStyleData(
                          maxHeight: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    DropdownButtonHideUnderline(
                      child: DropdownButton2<String>(
                        isExpanded: true,
                        hint: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text('학년 선택'),
                        ),
                        items: controller.gradeList
                            .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(item, style: TextStyle(fontSize: 14)),
                          ),
                        ))
                            .toList(),
                        value: controller.gradeSelectedValue.value,
                        onChanged: (value) {
                          controller.gradeSelectedValue.value = value;
                        },
                        buttonStyleData: ButtonStyleData(
                          height: 50,
                          width: 180,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(color: Colors.black26),
                            color: Colors.white,
                          ),
                        ),
                        dropdownStyleData: DropdownStyleData(
                          maxHeight: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.dialog(
                            AlertDialog(
                              backgroundColor: Colors.white,
                              title: const Text(
                                  "계열 및 전공 안내",
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              content: SizedBox(
                                width: 450,
                                height: 425,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 10.0),
                                      child: Text(
                                          "인문·사회계열",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Text("인문대학 : 국어국문학, 영어영문학, 철학"),
                                    Text("사회과학대학 : 정치외교학, 심리학, 언론정보학"),
                                    Text("법과대학 : 법학"),
                                    SizedBox(height: 10),

                                    Padding(
                                      padding: EdgeInsets.only(bottom: 10.0),
                                      child: Text(
                                          "자연계열",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Text("자연과학대학 : 수학, 물리학, 화학"),
                                    SizedBox(height: 10),

                                    Padding(
                                      padding: EdgeInsets.only(bottom: 10.0),
                                      child: Text(
                                          "공학계열",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Text("공과대학 : 기계공학, 전자공학, 컴퓨터공학"),
                                    SizedBox(height: 10),

                                    Padding(
                                      padding: EdgeInsets.only(bottom: 10.0),
                                      child: Text(
                                          "예술계열",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Text("예술대학 : 미술, 디자인, 연극영화"),
                                    Text("음악대학 : 성악, 작곡, 기악"),
                                    SizedBox(height: 10),

                                    Padding(
                                      padding: EdgeInsets.only(bottom: 10.0),
                                      child: Text(
                                          "체육계열",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Text("체육대학 : 체육학, 스포츠과학, 무용학"),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        child: Icon(
                          Icons.info_outline,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

}