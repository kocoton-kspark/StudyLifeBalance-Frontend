import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slb/pages/containers/eighth_container.dart';
import 'package:slb/pages/containers/seventh_container.dart';
import 'package:slb/pages/containers/sixth_container.dart';
import 'package:slb/pages/containers/tenth_container.dart';

import '../controllers/input_form_page_controller.dart';
import 'components/bottom_button.dart';
import 'containers/fourth-one_container.dart';
import 'containers/first_container.dart';
import 'containers/fourth_container.dart';
import 'containers/ninth_container.dart';
import 'containers/second_container.dart';
import 'containers/fifth_container.dart';
import 'containers/third_container.dart';

class InputFormPage extends StatefulWidget {
  const InputFormPage({super.key});

  @override
  State<InputFormPage> createState() => _InputFormPageState();
}

class _InputFormPageState extends State<InputFormPage> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<InputFormPageController>();
    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(10),
          child: Obx(() {
            final answered = controller.answeredCount;
            final total = controller.totalQuestions;
            final progress = controller.progress;
            final pct = (progress * 100).round();

            return Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // 진행 텍스트
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '진행도',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        '$answered / $total  ($pct%)',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: TweenAnimationBuilder<double>(
                      tween: Tween(begin: 0, end: progress),
                      duration: const Duration(milliseconds: 250),
                      builder: (_, value, __) => LinearProgressIndicator(
                        value: value,
                        minHeight: 8,
                        backgroundColor: Colors.grey[200],
                        color: Color(0xFF226BEF),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
      body: SingleChildScrollView(
        child: Obx(() => Column(
          children: [
            FirstContainer(),
            SecondContainer(),
            ThirdContainer(),
            FourthContainer(),
            controller.activitySelectedValue == '네'
                ? FourthOneContainer() : SizedBox.shrink(),
            FifthContainer(),
            SixthContainer(),
            SeventhContainer(),
            EighthContainer(),
            NinthContainer(),
            TenthContainer(),
            BottomButton(),
          ],
        ))
      ),
    );
  }
}
