import 'package:cross_media_recommendation/screens/EditableTitlePage.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../screens/ReportsPage.dart';

class AdminBodyMainController extends ControllerMVC{
  Widget? bodyWidget;
  void switchPage(int index, {dynamic data}){
    print("Switching: ");
    switch(index){
      case 0:
        bodyWidget = ReportPage();
        break;
      case 1:
        bodyWidget = EditableTitlePage(customData: data,);
    }
    setState(() {
    });
  }
}