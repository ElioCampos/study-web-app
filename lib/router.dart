import 'package:flutter/material.dart';
import 'package:study_web_app/pages/main_page.dart';
import 'package:study_web_app/pages/navigator.dart';
import 'package:study_web_app/pages/simulator_page.dart';
import 'package:study_web_app/pages/teacher/make_evaluation_page.dart';
import 'pages/login_page.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case 'main':
      return PageRouteBuilder(pageBuilder: (_, __, ___) => const MainPage());
    case 'login':
      return PageRouteBuilder(pageBuilder: (_, __, ___) => const LoginPage());
    case 'navigator':
      return PageRouteBuilder(
          pageBuilder: (_, __, ___) => const MainNavigator());
    case 'simulator':
      return PageRouteBuilder(
          pageBuilder: (_, __, ___) => const SimulatorPage());
    case 'makeExam':
      return PageRouteBuilder(
          pageBuilder: (_, __, ___) => const MakeEvaluationPage());
    default:
      return PageRouteBuilder(pageBuilder: (_, __, ___) => const MainPage());
  }
}
