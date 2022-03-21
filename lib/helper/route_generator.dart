import 'package:cross_media_recommendation/screens/EditableTitlePage.dart';
import 'package:cross_media_recommendation/screens/LoginPage.dart';
import 'package:cross_media_recommendation/screens/ReportsPage.dart';
import 'package:cross_media_recommendation/screens/TitleDescription.dart';
import 'package:cross_media_recommendation/screens/TitlePage.dart';
import 'package:cross_media_recommendation/screens/home_page.dart';
import 'package:flutter/material.dart';

import '../models/basic_title_model.dart';
import '../models/title_model.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/HomePage':
        return CustomPageRoute(settings: settings, builder: (context) => HomePage());
      case '/LoginPage':
        return CustomPageRoute(settings: settings, builder: (context) => LoginPage());
      case '/TitlePage':
        return CustomPageRoute(settings: settings, builder: (context) => TitlePage());
      case '/ReportPage':
        return CustomPageRoute(settings: settings, builder: (context) => ReportPage());
      case '/TitleDescription':
        return CustomPageRoute(settings: settings, builder: (context) => TitleDescription(titleModel: args as BasicTitleModel));
      // case '/':
      //   return MaterialPageRoute(settings: settings, builder: (context) => HomePage());
      case '/EditableTitlePage':
        return CustomPageRoute(settings: settings, builder: (context) => EditableTitlePage(customData: args as Map<String, dynamic>));
      default:
        return CustomPageRoute(settings: settings, builder: (context) => Text("Route Error"));
    }
  }
}

class CustomPageRoute extends MaterialPageRoute{
  CustomPageRoute({settings, builder}) : super(builder: builder, settings: settings);

  @override
  // TODO: implement transitionDuration
  Duration get transitionDuration => const Duration(milliseconds: 0);
}
