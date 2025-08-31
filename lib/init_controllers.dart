import 'package:get/get.dart';
import 'package:slb/controllers/home_page_controller.dart';

import 'controllers/input_form_page_controller.dart';

void initControllers() {
  Get.put(InputFormPageController());
  Get.put(HomePageController());
}
