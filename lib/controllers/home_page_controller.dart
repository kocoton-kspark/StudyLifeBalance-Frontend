import 'package:get/get.dart';

import '../helper/filter_quotes.dart';
import '../services/get_quotes.dart';

class HomePageController extends GetxController {
  RxString todayQuote = ''.obs;

  Future<void> fetchTodayQuote() async {
    final rawData = await getQuotes();
    todayQuote.value = filterQuotes(rawData);
  }
}