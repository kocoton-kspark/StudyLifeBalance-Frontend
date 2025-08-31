import 'package:dio/dio.dart';

Future<Map<String, dynamic>> getQuotes() async {
  final dio = Dio();
  try {
    final response = await dio.get('https://716b1ef6a8d6.ngrok-free.app/api/v0/quotes');
    return response.data;
  } catch (e) {
    throw Exception("getQuotes Error: $e");
  }
}