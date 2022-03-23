import 'package:cross_media_recommendation/controllers/sidepane_controller.dart';
import 'package:cross_media_recommendation/elements/ButtonComponent.dart';
import 'package:cross_media_recommendation/elements/CustomSpacer.dart';
import 'package:cross_media_recommendation/elements/ReportMissingTitleDialogDef.dart';
import 'package:cross_media_recommendation/elements/ReportMissionTitle.dart';
import 'package:cross_media_recommendation/elements/UserBrief.dart';
import 'package:cross_media_recommendation/helper/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';


class SidePane extends StatefulWidget {
  @override
  PageState createState() => PageState();

}

class PageState extends StateMVC<SidePane>{
  SidePaneController? con;

  PageState() : super(SidePaneController()){
    con = controller as SidePaneController;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: testDec,
      margin: EdgeInsets.only(top: 20, bottom: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          UserBrief(),
          Column(
            children: [
              InkWell(
                onTap: (){
                  // showDialog(
                  //   context: context,
                  //   builder: (context){
                  //     return ReportMissingTitle();
                  //   }
                  // );
                  ReportMissingTitleDialogDef().show(context);
                },
                child: Text(
                  "Report a Missing Title",
                  style: TextStyle(
                    fontSize: 12,
                    color: primaryTextColor.withOpacity(0.5)
                  ),
                ),
              ),
              CustomSpacer(height: 30,),
              ButtonComponent(title: 'Logout', onClick: con!.logout),
            ],
          )
        ],
      ),
    );
  }
}