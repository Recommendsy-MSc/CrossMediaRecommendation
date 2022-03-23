import 'package:cross_media_recommendation/controllers/report_dialog_controller.dart';
import 'package:cross_media_recommendation/elements/ButtonComponent.dart';
import 'package:cross_media_recommendation/elements/CustomSpacer.dart';
import 'package:cross_media_recommendation/helper/FToastHelper.dart';
import 'package:cross_media_recommendation/helper/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../models/title_model.dart';

class ReportDialog extends StatefulWidget{
  String? name;
  TitleModel? titleModel;

  ReportDialog({Key? key, required this.titleModel, this.name}) : super(key: key);
  @override
  PageState createState() => PageState();
}

class PageState extends StateMVC<ReportDialog>{
  ReportDialogController? con;
  PageState() : super(ReportDialogController()){
    con = controller as ReportDialogController;
  }



  @override
  void initState(){
    super.initState();
    con!.titleModel = widget.titleModel;
  }
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: primaryColor,
      title: Text(
          widget.name!,
        style: TextStyle(
          fontSize: 18,
          color: accentColor
        )
      ),
      content: !con!.selectedReportType
        ? Container(
        decoration: BoxDecoration(

        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: (){
                con!.selectedReportType = true;
                setState(() {

                });
              },
              child: Container(
                padding: edgeInsetsAll8,
                child: Text(
                  "Report Inaccurate Data",
                  style: TextStyle(
                    fontSize: 14,
                    color: primaryTextColor.withOpacity(0.7)
                  ),
                ),
              ),
            ),
            CustomSpacer(height: 10,),
            InkWell(
              onTap: () async {
                con!.reportBrokenLink();
                Navigator.of(context).pop();
              },
              child: Container(
                padding: edgeInsetsAll8,

                child: Text(
                  "Report Broken Links",
                  style: TextStyle(
                      fontSize: 14,
                      color: primaryTextColor.withOpacity(0.7)
                  ),
                ),
              ),

            )
          ],
        ),
      ) : Container(
        width: MediaQuery.of(context).size.width * 0.3,
        child: Form(
          key: con!.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Description",
                style: TextStyle(
                  fontSize: 12,
                  color: primaryTextColor.withOpacity(0.5)
                ),
              ),
              CustomSpacer(height: 8,),
              TextFormField(
                 controller: con!.textController,
                keyboardType: TextInputType.multiline,
                maxLines: 6,
                minLines: 6,
                decoration: InputDecoration(
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
                  fontSize: 12,
                  letterSpacing: 1.01
                ),
              ),
            ],
          ),
        )
      ),
      actions: con!.selectedReportType ? [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ButtonComponent(title: "Submit", onClick: () async{
              Navigator.of(context).pop(await con!.reportInaccurateData());
            }),
            ButtonComponent(title: "Cancel", onClick: (){
              Navigator.of(context).pop();
            })
          ],
        )
      ] : [
        ButtonComponent(title: "Cancel", onClick: (){
          Navigator.of(context).pop();
        })
      ],
      actionsPadding: edgeInsetsAll20,
    );
  }
}