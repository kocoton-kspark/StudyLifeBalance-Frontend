import 'package:dio/dio.dart';

Future<Map<String, dynamic>> surveysPercentage({
  required String mbti,
  required String categoryCode,
}) async {
  final dio = Dio();
  try {
    final response = await dio.post(
        'https://716b1ef6a8d6.ngrok-free.app/api/v0/surveys/percentage',
        data:
        {
          "mbti": mbti,
          "category_code": categoryCode
        }
    );
    return response.data;
  } catch (e) {
    throw Exception("surveysResult Error: $e");
  }
}