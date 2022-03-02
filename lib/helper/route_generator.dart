import 'package:cross_media_recommendation/screens/home_page.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/HomePage':
        return MaterialPageRoute(builder: (context) => HomePage());
      default:
        return MaterialPageRoute(builder: (_) => Scaffold(body: SafeArea(child: Center(child: Text('Route Error')))));
    }
  }
}
