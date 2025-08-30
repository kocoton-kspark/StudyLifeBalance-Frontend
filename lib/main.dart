import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:media_store_plus/media_store_plus.dart';

import 'index.dart';
import 'init_controllers.dart';
import 'pages/input_form_page.dart';

void main() async {
  initControllers();
  WidgetsFlutterBinding.ensureInitialized();
  await MediaStore.ensureInitialized();
  MediaStore.appFolder = 'SLB';

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const IndexPage(),
    );
  }
}
