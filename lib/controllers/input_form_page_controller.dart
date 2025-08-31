import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slb/helper/clean_text.dart';
import 'package:slb/services/sureys_percentage.dart';
import 'package:slb/services/surveys_recommend_tips.dart';

import '../services/surveys_result.dart';

class InputFormPageController extends GetxController {
  // First Page
  final TextEditingController firstPageTextEditingController = TextEditingController();
  RxString firstPageInputValue = ''.obs;

  // Second Page
  final List<String> collegeList = [
    '인문사회계열',
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

  final TextEditingController externalTimeTextEditingController = TextEditingController();
  RxString externalTime = "".obs;

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

  RxString category = ''.obs;
  RxString code = ''.obs;
  RxString description = ''.obs;
  RxInt majorRatio = 0.obs;
  RxInt studyRatio = 0.obs;
  RxInt outdoorActivityRatio = 0.obs;
  RxInt mbtiPercentage = 0.obs;

  RxString studyRecommend = ''.obs;
  RxString restRecommend = "".obs;

  Future<void> fetchAllInformation() async {
    try {
      final response = await surveysResult(
        college: firstPageInputValue.value,
        grade: int.tryParse(gradeSelectedValue.value ?? "") ?? 0,
        major: collegeSelectedValue.value ?? "",
        studyTime: (collegeSelectedValue.value ?? "") == "자연계열" ? 10 : 2,
        restTime:  (collegeSelectedValue.value ?? "") == "자연계열" ? 2  : 10,
        sleepTime: sleepTime.value.toInt(),
        majorCredit: int.tryParse(majorPageInputValue.value) ?? 0,
        generalCredit: int.tryParse(generalPageInputValue.value) ?? 0,
        externalActivitiesTime: int.tryParse(externalTime.value) ?? 0,
        mbti: tenthPageInputValue.value,
        outsideTime: (collegeSelectedValue.value ?? "") == "자연계열" ? false : true,
      );

      // 문자열 계열은 안전하게 toString
      category.value     = (response['category'] ?? '').toString();
      code.value         = (response['code'] ?? '').toString();
      description.value  = (response['description'] ?? '').toString();

      // 숫자 계열은 num? -> int로 안전 변환
      majorRatio.value           = (response['major_ratio'] as num?)?.toInt() ?? 0;
      studyRatio.value           = (response['study_ratio'] as num?)?.toInt() ?? 0;
      outdoorActivityRatio.value = (response['outdoor_activity_ratio'] as num?)?.toInt() ?? 0;

      final mbtiResponse = await surveysPercentage(
          mbti: tenthPageInputValue.value,
          categoryCode: code.value,
      );

      mbtiPercentage.value = (mbtiResponse['percentage'] as num).toInt();
      description.value = cleanText(description.value);

      final recommendResponse = await surveysRecommendTips(
        college: firstPageInputValue.value,
        grade: int.tryParse(gradeSelectedValue.value ?? "") ?? 0,
        major: collegeSelectedValue.value ?? "",
        studyTime: (collegeSelectedValue.value ?? "") == "자연계열" ? 10 : 2,
        restTime:  (collegeSelectedValue.value ?? "") == "자연계열" ? 2  : 10,
        sleepTime: sleepTime.value.toInt(),
        majorCredit: int.tryParse(majorPageInputValue.value) ?? 0,
        generalCredit: int.tryParse(generalPageInputValue.value) ?? 0,
        externalActivitiesTime: int.tryParse(externalTime.value) ?? 0,
        mbti: tenthPageInputValue.value,
        outsideTime: (collegeSelectedValue.value ?? "") == "자연계열" ? false : true,
      );

      studyRecommend.value = (recommendResponse['study_recommend'] ?? '').toString();
      restRecommend.value = (recommendResponse['rest_recommend'] ?? '').toString();


    } catch (e, st) {
      print('fetchAllInformation error: $e');
      print(st);
      rethrow;
    }
  }

  void resetState() {
    // First Page
    firstPageTextEditingController.clear();
    firstPageInputValue.value = '';

    // Second Page
    collegeSelectedValue.value = null;
    gradeSelectedValue.value = null;

    // Third Page
    majorTextEditingController.clear();
    majorPageInputValue.value = '';
    generalTextEditingController.clear();
    generalPageInputValue.value = '';

    // Fourth - Eighth Pages
    activitySelectedValue.value = null;
    fifthSelectedValue.value = null;
    sixthSelectedValue.value = null;
    seventhSelectedValue.value = null;
    eighthSelectedValue.value = null;

    // Ninth Page
    sleepTime.value = 0.0;

    // Tenth Page
    tenthPageTextEditingController.clear();
    tenthPageInputValue.value = '';
  }
}