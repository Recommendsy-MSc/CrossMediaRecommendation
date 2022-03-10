import 'package:cross_media_recommendation/screens/LoginPage.dart';
import 'package:cross_media_recommendation/screens/TitlePage.dart';
import 'package:cross_media_recommendation/screens/home_page.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/HomePage':
        return MaterialPageRoute(settings: settings, builder: (context) => HomePage());
      case '/LoginPage':
        return MaterialPageRoute(settings: settings, builder: (context) => LoginPage());
      case '/TitlePage':
        return MaterialPageRoute(settings: settings, builder: (context) => TitlePage());
      // case '/':
      //   return MaterialPageRoute(settings: settings, builder: (context) => HomePage());
      default:
        return MaterialPageRoute(settings: settings, builder: (context) => Text("Route Error"));
    }
  }
}
