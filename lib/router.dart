import 'package:flutter/material.dart';
import 'package:study_web_app/pages/main_page.dart';
import 'package:study_web_app/pages/navigator.dart';
import 'pages/login_page.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  // var id = settings.arguments as int;
  // var userId = settings.arguments as int;
  switch (settings.name) {
    case 'main':
      return PageRouteBuilder(pageBuilder: (_, __, ___) => const MainPage());
    case 'login':
      return PageRouteBuilder(pageBuilder: (_, __, ___) => const LoginPage());
    case 'navigator':
      return PageRouteBuilder(pageBuilder: (_, __, ___) => const MainNavigator());
    default:
      return MaterialPageRoute(builder: (context) => const MainPage());
  }
}