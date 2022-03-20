import 'package:cross_media_recommendation/controllers/reports_page_controller.dart';
import 'package:cross_media_recommendation/elements/AdminSidePane.dart';
import 'package:cross_media_recommendation/elements/CustomSpacer.dart';
import 'package:cross_media_recommendation/elements/BrokenLinkReportTile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../elements/InaccurateDataReportTile.dart';
import '../elements/InaccurateRecomReportTile.dart';
import '../elements/MissingTitleReportTile.dart';
import '../helper/constants.dart';

class ReportPage extends StatefulWidget{
  int currentReports;
  ReportPage({this.currentReports = 0});
  @override
  PageState createState() => PageState();
}

class PageState extends StateMVC<ReportPage> with TickerProviderStateMixin{
  // TabController? tabController;
  ReportsPageController? con;

  PageState() : super(ReportsPageController()){
    con = controller as ReportsPageController;
  }

  @override
  void initState(){
    super.initState();
    con!.currentReports = widget.currentReports;
    con!.reload();
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          InkWell(
                            onTap: (){
                              con!.switchReports(0);
                            },
                            child: Container(
                              padding: EdgeInsets.only(top: 4, right: 4, bottom: 4),
                              child: Text(
                                "Inaccurate Recommendations",
                                style: TextStyle(
                                  color: con!.currentReports == 0 ? primaryTextColor : primaryTextColor.withOpacity(0.6),
                                  fontSize: 14
                                ),
                              ),
                            ),
                          ),
                          CustomSpacer(width: 30,),
                          InkWell(
                            onTap: (){
                              con!.switchReports(1);
                            },
                            child: Container(
                              padding: edgeInsetsAll4,
                              child: Text(
                                "Inaccurate Data",
                                style: TextStyle(
                                    color: con!.currentReports == 1 ? primaryTextColor : primaryTextColor.withOpacity(0.6),
                                    fontSize: 14
                                ),
                              ),
                            ),
                          ),
                          // CustomSpacer(width: 30,),
                          // InkWell(
                          //   onTap: (){
                          //     con!.switchReports(2);
                          //   },
                          //   child: Container(
                          //     padding: edgeInsetsAll4,
                          //     child: Text(
                          //       "Broken Links",
                          //       style: TextStyle(
                          //           color: con!.currentReports == 2 ? primaryTextColor : primaryTextColor.withOpacity(0.6),
                          //           fontSize: 14
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          CustomSpacer(width: 30,),
                          InkWell(
                            onTap: (){
                              con!.switchReports(2);
                            },
                            child: Container(
                              padding: edgeInsetsAll4,
                              child: Text(
                                "Missing Titles",
                                style: TextStyle(
                                    color: con!.currentReports == 2 ? primaryTextColor : primaryTextColor.withOpacity(0.6),
                                    fontSize: 14
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        con!.reload();
                      },
                      child: Container(
                        child: Icon(
                          Icons.refresh_rounded,
                          color: primaryTextColor.withOpacity(0.7),
                        )
                      ),
                    )
                  ],
                ),
                CustomSpacer(height: 30,),
                Expanded(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: con!.currentReports == 0 ?

                    con!.recomList.isNotEmpty
                        ? ListView.builder(
                          itemCount: con!.recomList.length,
                          itemBuilder: (context, index){
                            return InaccurateRecomReportTile(object: con!.recomList[index], reloadCallback: con!.reload,);
                          },
                        )
                        : Text(
                            "No Reports!",
                            style: TextStyle(
                              fontSize: 14,
                              color: primaryTextColor.withOpacity(0.8)
                            ),
                          )
                    : con!.currentReports == 1
                    ? con!.dataList.isNotEmpty
                        ? ListView.builder(
                          itemCount: con!.dataList.length,
                          itemBuilder: (context, index){
                            return InaccurateDataReportTile(object: con!.dataList[index],);
                          },
                          )
                        : Text(
                            "No Reports!",
                            style: TextStyle(
                                fontSize: 14,
                                color: primaryTextColor.withOpacity(0.8)
                            ),
                          )
                    : con!.missingTitlesList.isNotEmpty ? ListView.builder(
                      itemCount: con!.missingTitlesList.length,
                      itemBuilder: (context, index){
                        return MissingTitleReportTile(object: con!.missingTitlesList[index],);
                      },
                    )
                        : Text(
                    "No Reports!",
                    style: TextStyle(
                        fontSize: 14,
                        color: primaryTextColor.withOpacity(0.8)
                    ),
                  )
                    // ListView.builder(
                    //   itemCount: con!.brokenLinkList.length,
                    //   itemBuilder: (context, index){
                    //     return BrokenLinkReportTile(object: con!.brokenLinkList[index],);
                    //   },
                    // ),
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