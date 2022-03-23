import 'package:cross_media_recommendation/controllers/admin_body_main_controller.dart';
import 'package:cross_media_recommendation/controllers/body_main_controller.dart';
import 'package:cross_media_recommendation/controllers/home_page_controller.dart';
import 'package:flutter/material.dart';
import '../elements/Loader.dart';
import '../helper/constants.dart';
import '../models/basic_title_model.dart';


// To control state of body page
BodyMainController? bodyMainController;
AdminBodyMainController? adminBodyMainController;
// To control state of entire page
HomePageController? homePageController;

BasicTitleModel? currentTitle;

void showLoader(context){
  showDialog(
      context: context,
      builder: (context){
        return Loading(color: primaryTextColor,);
      }
  );
}

void hideLoader(context){
  Navigator.of(context).pop();
}