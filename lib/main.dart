import 'package:cross_media_recommendation/helper/route_generator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cross_media_recommendation/helper/constants.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: '/HomePage',
      theme: ThemeData(
        textTheme: TextTheme(
          headline1: TextStyle(color: textColor, fontSize: 26),
          headline6: TextStyle(color: accentColor.withOpacity(0.7), fontSize: 14),
          headline3: TextStyle(color: accentColor, fontSize: 22),
          headline5: TextStyle(color: accentColor, fontSize: 12),
        ),
        inputDecorationTheme: InputDecorationTheme(
          focusColor: accentColor,
        ),
      ),
    );
  }
}