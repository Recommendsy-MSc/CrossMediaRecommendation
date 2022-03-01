
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {

      default:
        return MaterialPageRoute(builder: (_) => Scaffold(body: SafeArea(child: Center(child: Text('Route Error')))));
    }
  }
}
