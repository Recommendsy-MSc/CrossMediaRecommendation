import 'package:cross_media_recommendation/elements/AppTitle.dart';
import 'package:cross_media_recommendation/elements/CustomSpacer.dart';
import 'package:cross_media_recommendation/elements/SidePaneMenu.dart';
import 'package:cross_media_recommendation/elements/UserBrief.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeSidePane extends StatefulWidget{
  HomeSidePane({Key? key}) : super(key: key);

  @override
  PageState createState() => PageState();
}

class PageState extends State<HomeSidePane>{
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTitle(),
        CustomSpacer(height: 20),
        SidePaneMenu(),
      ],
    );
  }
}