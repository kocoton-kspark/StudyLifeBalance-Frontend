import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slb/controllers/input_form_page_controller.dart';

import 'result_page/result_page.dart';


class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  final controller = Get.find<InputFormPageController>();
  @override
  void initState() {
    super.initState();
    _navigateAfterDelay();
  }

  Future<void> _navigateAfterDelay() async {
    controller.fetchAllInformation();
    await Future.delayed(const Duration(seconds: 3));
    Get.off(() => ResultPage());
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CupertinoActivityIndicator(
              color: Color(0xFF226BEF),
              radius: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(
                "스라벨 정밀 분석 중...",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: width * 0.076,
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}