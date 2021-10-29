import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_web_app/router.dart' as router;
import 'package:study_web_app/utils/global.dart';
void main() {
  Get.put(GlobalController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Study App",
      initialRoute: 'main',
      onGenerateRoute: router.generateRoute,
    );
  }
}
