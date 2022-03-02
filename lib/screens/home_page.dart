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
      body: Row(
        children: [
          Container(
            padding: edgeInsetsAll32,
            // margin: EdgeInsets.symmetric(vertical: 20),
            width: MediaQuery.of(context).size.width * 0.18,
            decoration: BoxDecoration(
              // borderRadius: BorderRadius.only(topLeft: radius30,),
              border: Border(right: BorderSide(color: primaryColor.withOpacity(0.6), width: 0.1)),
              color: primaryColor,
            ),
            child: HomeSidePane(),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.62,
            color: primaryColor,
            // decoration: testDec,
            child: Column(
              children: [
                // Container(
                //   // decoration: testDec,
                //   padding: EdgeInsets.only(top: 20, left: 32, right: 32, bottom: 0),
                //   // decoration: testDec,
                //   child: TopNav()
                // ),
                Expanded(
                  child: SingleChildScrollView(
                    child: HomeBody(),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: edgeInsetsAll32,
            // margin: EdgeInsets.symmetric(vertical: 20),
            width: MediaQuery.of(context).size.width * 0.2,
            decoration: BoxDecoration(
              // borderRadius: BorderRadius.only(topLeft: radius30,),
              border: Border(right: BorderSide(color: primaryColor.withOpacity(0.6), width: 0.1)),
              color: primaryColor,
            ),
            child: HomeSidePane(),
          ),
        ],
      )
    );
  }
}