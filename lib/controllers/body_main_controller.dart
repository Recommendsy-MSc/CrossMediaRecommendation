import 'package:cross_media_recommendation/elements/HomeBody.dart';
import 'package:cross_media_recommendation/screens/TitleDescription.dart';
import 'package:cross_media_recommendation/screens/TitlePage.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';


class BodyMainController extends ControllerMVC{
  Widget? bodyWidget;

  void switchPage(int index){
    switch(index){
      case 0:
        bodyWidget = HomeBody();
        break;
      default:
        bodyWidget = TitleDescription();
        break;
    }
    setState(() { });
  }
}