import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InputFormPageController extends GetxController {
  // First Page
  final TextEditingController firstPageTextEditingController = TextEditingController();
  RxString firstPageInputValue = ''.obs;

  // Second Page
  final List<String> collegeList = [
    '인문·사회계열',
    '자연계열',
    '공학계열',
    '예술계열',
    '체육계열'
  ];
  final List<String> gradeList = ['1', '2', '3', '4', '5'];
  final RxnString collegeSelectedValue = RxnString();
  final RxnString gradeSelectedValue = RxnString();

  // Third Page
  final TextEditingController majorTextEditingController = TextEditingController();
  RxString majorPageInputValue = ''.obs;

  final TextEditingController generalTextEditingController = TextEditingController();
  RxString generalPageInputValue = ''.obs;

  //Fourth Page
  final RxnString activitySelectedValue = RxnString();
  void selectActivity(String? value) => activitySelectedValue.value = value;

  //Fifth Page
  final RxnString fifthSelectedValue = RxnString();
  void selectFifth(String? value) => fifthSelectedValue.value = value;

  //Sixth Page
  final RxnString sixthSelectedValue = RxnString();
  void selectSixth(String? value) => sixthSelectedValue.value = value;

  //Seventh Page
  final RxnString seventhSelectedValue = RxnString();
  void selectSeventh(String? value) => seventhSelectedValue.value = value;

  //Eighth Page
  final RxnString eighthSelectedValue = RxnString();
  void selectEighth(String? value) => eighthSelectedValue.value = value;

  //Ninth Page
  final RxDouble sleepTime = 0.0.obs;
  void selectSleepTime(double value) => sleepTime.value = value;

  //Tenth Page
  final TextEditingController tenthPageTextEditingController = TextEditingController();
  RxString tenthPageInputValue = ''.obs;

  int get totalQuestions => 11;

  int get answeredCount {
    int c = 0;
    if (firstPageInputValue.value.trim().isNotEmpty) c++;
    if (collegeSelectedValue.value != null) c++;
    if (gradeSelectedValue.value != null) c++;
    if (majorPageInputValue.value.trim().isNotEmpty) c++;
    if (generalPageInputValue.value.trim().isNotEmpty) c++;
    if (activitySelectedValue.value != null) c++;
    if (fifthSelectedValue.value != null) c++;
    if (sixthSelectedValue.value != null) c++;
    if (seventhSelectedValue.value != null) c++;
    if (eighthSelectedValue.value != null) c++;
    if (sleepTime.value != 0) c++;
    return c;
  }

  double get progress {
    final t = totalQuestions;
    if (t == 0) return 0;
    return (answeredCount / t).clamp(0, 1);
  }
}