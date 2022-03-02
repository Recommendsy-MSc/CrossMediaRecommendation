import 'package:cross_media_recommendation/elements/HomeBody.dart';
import 'package:cross_media_recommendation/elements/HomeSidePane.dart';
import 'package:cross_media_recommendation/elements/top_nav.dart';
import 'package:cross_media_recommendation/helper/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  @override
  PageState createState () => PageState();
}

class PageState extends State<HomePage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topRight,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            color: primaryColor,
            padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.25),
            child: Column(
              children: [
                Container(
                  // decoration: testDec,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  // decoration: testDec,
                  child: TopNav()
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: HomeBody(),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: edgeInsetsAll20,
            margin: EdgeInsets.symmetric(vertical: 20),
            width: MediaQuery.of(context).size.width * 0.25,
            decoration: BoxDecoration(
              // borderRadius: BorderRadius.only(topLeft: radius30,),
              border: Border(left: BorderSide(color: accentColor.withOpacity(0.5), width: 0.4)),
              color: primaryColor,
            ),
            child: HomeSidePane(),
          ),
        ],
      )
    );
  }
}