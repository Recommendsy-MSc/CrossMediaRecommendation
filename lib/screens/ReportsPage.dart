import 'package:cross_media_recommendation/controllers/reports_page_controller.dart';
import 'package:cross_media_recommendation/elements/AdminSidePane.dart';
import 'package:cross_media_recommendation/elements/CustomSpacer.dart';
import 'package:cross_media_recommendation/elements/ReportTile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../helper/constants.dart';

class ReportPage extends StatefulWidget{
  @override
  PageState createState() => PageState();
}

class PageState extends StateMVC<ReportPage> with TickerProviderStateMixin{
  TabController? tabController;
  ReportsPageController? con;

  PageState() : super(ReportsPageController()){
    con = controller as ReportsPageController;
  }

  @override
  void initState(){
    super.initState();
    tabController = TabController(length: 3, vsync: this);
    tabController!.animateTo(1);
  }

  @override
  void dispose(){
    super.dispose();
    tabController!.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Row(
        children: [
          Container(
            padding: edgeInsetsAll20,
            width: MediaQuery.of(context).size.width * 0.75,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    "Reports",
                    style: Theme.of(context).textTheme.headline1
                  )
                ),
                CustomSpacer(height: 20,),
                Container(
                  child: Row(
                    children: [
                      Text(
                        "Broken Links",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      CustomSpacer(),
                      Text(
                        "Inaccurate Recommendations",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      CustomSpacer(),
                      Text(
                        "Inaccurate Data",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ],
                  ),
                ),
                CustomSpacer(height: 30,),
                Expanded(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index){
                        return ReportTile();
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            margin: EdgeInsets.symmetric(vertical: 20),
            width: MediaQuery.of(context).size.width * 0.25,
            decoration: BoxDecoration(
              border: Border(left: BorderSide(color: primaryTextColor.withOpacity(0.4), width: 0.5))
            ),
            child: AdminSidePane(reportsPageController: con!,),
          )
        ],
      )
    );
  }
}