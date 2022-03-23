import 'package:cross_media_recommendation/app_config.dart';
import 'package:cross_media_recommendation/helper/custom_scroll_behaviour.dart';
import 'package:cross_media_recommendation/helper/firebase.dart';
import 'package:cross_media_recommendation/helper/route_generator.dart';
import 'package:cross_media_recommendation/network/rest_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cross_media_recommendation/helper/constants.dart';

void main(){
  setUpConfiguration();
  RestService.init();
  MyFirebase.initializeFirebase();
  runApp(MyApp());
}


// TODO: Change MyApp name.
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: MyCustomScrollBehaviour(),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: '/LoginPage',
      theme: ThemeData(
        scaffoldBackgroundColor: primaryColor,
        textTheme: TextTheme(
          headline1: TextStyle(color: accentColor, fontSize: 26),
          headline2: TextStyle(color: primaryTextColor, fontSize: 26),
          headline5: TextStyle(color: primaryTextColor.withOpacity(0.7), fontSize: 18),
          headline3: TextStyle(color: primaryTextColor, fontSize: 22),
          headline4: TextStyle(color: primaryTextColor, fontSize: 18),
          headline6: TextStyle(color: primaryTextColor, fontSize: 14),
        ),
        inputDecorationTheme: InputDecorationTheme(
          focusColor: accentColor,
        ),
      ),
    );
  }
}

void setUpConfiguration() {
  AppConfig.setEnvironment(Environment.DEVELOPMENT);
}