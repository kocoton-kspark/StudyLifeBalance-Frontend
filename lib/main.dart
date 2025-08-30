import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'init_controllers.dart';
import 'pages/input_form_page.dart';

void main() {
  runApp(const MyApp());
  initControllers();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const InputFormPage(),
    );
  }
}
