import 'package:cross_media_recommendation/controllers/report_dialog_controller.dart';
import 'package:cross_media_recommendation/elements/ButtonComponent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../helper/constants.dart';
import 'CustomSpacer.dart';

class ReportMissingTitle extends StatefulWidget{
  @override
  PageState createState() => PageState();
}

class PageState extends StateMVC{
  ReportDialogController? con;


  PageState() : super(ReportDialogController()){
    con = controller as ReportDialogController;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: primaryColor,
      actionsPadding: edgeInsetsAll20,
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ButtonComponent(title: "Submit", onClick: () async{
              await con!.reportMissingTitle();
              Navigator.of(context).pop();
            }),
            ButtonComponent(title: 'Cancel', onClick: (){
              Navigator.of(context).pop();
            })
          ],
        )
      ],
      content: Container(
        width: MediaQuery.of(context).size.width * 0.3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              child: Text(
                "Report Missing Title",
                style: TextStyle(
                    fontSize: 14,
                    color: primaryTextColor.withOpacity(0.7)
                ),
              )
            ),
            CustomSpacer(height: 20,),
            Form(
              key: con!.formKey,
              child: TextFormField(
                controller: con!.textController,
                keyboardType: TextInputType.multiline,
                maxLines: 1,
                minLines: 1,
                decoration: InputDecoration(
                  hintText: 'Eg. Spider Man',
                  fillColor: primaryTextColor.withOpacity(0.1),
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)
                  )
                ),
                style: TextStyle(
                    color: primaryTextColor,
                    fontSize: 14,
                    letterSpacing: 1.01
                ),
              ),
            ),
            CustomSpacer(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: (){
                    con!.switchTitleType(movie: true);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    width: 80,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: con!.seletecTitleTypeMovie ? accentColor : primaryColor
                    ),
                    child: Text(
                      "Movie",
                      style: TextStyle(
                        color: primaryTextColor
                      ),
                    ),
                  ),
                ),
                CustomSpacer(width: 30,),
                InkWell(
                  onTap: (){
                    con!.switchTitleType(movie: false);
                  },
                  child: Container(
                    width: 80,
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                        color: !con!.seletecTitleTypeMovie ? accentColor : primaryColor
                    ),
                    child: Text(
                      "Tv",
                      style: TextStyle(
                          color: primaryTextColor
                      ),
                    ),
                  ),
                ),

              ],
            )
          ],
        ),
      ),
    );
  }
}