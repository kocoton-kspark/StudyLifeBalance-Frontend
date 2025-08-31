import 'package:dio/dio.dart';

Future<Map<String, dynamic>> surveysRecommendTips({
  required String college,
  required int grade,
  required String major,
  required int studyTime,
  required int restTime,
  required int sleepTime,
  required int majorCredit,
  required int generalCredit,
  required int externalActivitiesTime,
  required String mbti,
  required bool outsideTime
}) async {
  final dio = Dio();
  try {
    final response = await dio.post(
        'https://716b1ef6a8d6.ngrok-free.app/api/v0/surveys/recommend-tips',
        data:
        {
          "college": college,
          "grade": grade,
          "major": major,
          "study_time": studyTime,
          "rest_time": restTime,
          "sleep_time": sleepTime,
          "major_credit": majorCredit,
          "general_credit": generalCredit,
          "external_activities_time": externalActivitiesTime,
          "mbti": mbti,
          "outside_time": outsideTime,
        }
    );
    return response.data;
  } catch (e) {
    throw Exception("surveysRecommendTips Error: $e");
  }
}