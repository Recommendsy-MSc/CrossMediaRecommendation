import 'package:cross_media_recommendation/controllers/report_tile_controller.dart';
import 'package:cross_media_recommendation/models/reports_models/missing_title_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../helper/constants.dart';
import 'CustomSpacer.dart';

class MissingTitleReportTile extends StatefulWidget{
  MissingTitleModel object;
  Function? reloadCallback;

  MissingTitleReportTile({required this.object, this.reloadCallback});

  @override
  PageState createState() => PageState();
}

class PageState extends StateMVC<MissingTitleReportTile>{
  ReportTileController? con;

  PageState() : super(ReportTileController()){
    con = controller as ReportTileController;
  }

  @override
  void initState(){
    super.initState();
    con!.reloadCallback = widget.reloadCallback;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: edgeInsetsAll12,
        // decoration: testDec,
        decoration: BoxDecoration(
            color: white.withOpacity(0.2),
            borderRadius: borderRadius4
        ),
        margin: EdgeInsets.symmetric(vertical: 8),
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap:(){
                      if(widget.object.active!) {
                        con!.gotToMissingTitle(object: widget.object);
                      }
                    },
                    child: Container(
                      width: 100,
                      // decoration: testDec,
                      child: Text(
                        "#" + widget.object.id!,
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 14,
                            letterSpacing: 1.01
                        ),
                      ),
                    ),
                  ),
                  CustomSpacer(),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            // decoration: testDec,
                            child: Text(
                              widget.object.title!,
                              style: TextStyle(
                                  color: primaryTextColor.withOpacity(0.7),
                                  fontSize: 14,
                                  letterSpacing: 1.01
                              ),
                            ),
                          ),
                        ),
                        CustomSpacer(width: 50,),
                        !widget.object.active! ? Expanded(
                          child: Tooltip(
                            message: "# ID of Title Added",
                            child: Container(
                              // decoration: testDec,
                              child: Text(
                                widget.object.added!,
                                style: TextStyle(
                                    color: primaryTextColor.withOpacity(0.7),
                                    fontSize: 14,
                                    letterSpacing: 1.01
                                ),
                              ),
                            ),
                          ),
                        ) : Container(),
                        CustomSpacer(width: 50,),
                      ],
                    ),
                  ),
                  CustomSpacer(width: 50,),
                  Container(
                    // decoration: testDec,
                    child: Text(
                      widget.object.title_type == 0 ? 'Movie' : 'Tv',
                      style: TextStyle(
                          color: primaryTextColor.withOpacity(0.7),
                          fontSize: 14,
                          letterSpacing: 1.01
                      ),
                    ),
                  ),
                  CustomSpacer(width: 50,),
                  Container(
                    // decoration: testDec,
                    child: Text(
                      "User #" + widget.object.user!,
                      style: TextStyle(
                          color: primaryTextColor.withOpacity(0.7),
                          fontSize: 14,
                          letterSpacing: 1.01
                      ),
                    ),
                  ),
                  CustomSpacer(width: 50,),

                ],
              ),
            ),
            Container(
              // decoration: testDec,
              child: Row(
                children: [
                  Tooltip(
                    message: "Created on",
                    child: Container(
                      // decoration: testDec,
                      child: Text(
                        widget.object.created_date!.substring(0, 10),
                        style: TextStyle(
                            color: primaryTextColor.withOpacity(0.7),
                            fontSize: 14,
                            letterSpacing: 1.01
                        ),
                      ),
                    ),
                  ),
                  widget.object.active! ? Container() : CustomSpacer(width: 50,),
                  widget.object.active!
                      ? Container() :
                  Tooltip(
                    message: "Completed on",
                    child: Container(
                      // decoration: testDec,
                      child: Text(
                        widget.object.completedDate != null ? widget.object.completedDate!.substring(0, 10) : "",
                        style: TextStyle(
                            color: primaryTextColor.withOpacity(0.7),
                            fontSize: 14,
                            letterSpacing: 1.01
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

          ],
        )
    );
  }
}