import 'package:cross_media_recommendation/controllers/report_tile_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../helper/constants.dart';
import '../models/reports_models/inaccurate_data_model.dart';
import '../models/reports_models/inaccurate_recom_model.dart';
import 'CustomSpacer.dart';

class InaccurateDataReportTile extends StatefulWidget{
  InaccurateDataModel? object;
  Function? reloadCallback;
  InaccurateDataReportTile({Key? key, required this.object, this.reloadCallback}) : super(key: key);
  @override
  PageState createState() => PageState();
}

class PageState extends StateMVC<InaccurateDataReportTile>{
  ReportTileController? con;

  PageState() : super(ReportTileController()){
    con = controller as ReportTileController;
  }

  @override
  void initState(){
    super.initState();
    con!.reloadCallback = widget.reloadCallback!;
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
                    onTap: () async{
                      await con!.gotoTitle(id: widget.object!.title!, type: widget.object!.type!, reportId: widget.object!.id!);

                    },
                    child: Container(
                      width: 100,
                      // decoration: testDec,
                      child: Text(
                        "#" + widget.object!.title!,
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
                    child: Container(
                      // decoration: testDec,
                      child: Text(
                        widget.object!.name!,
                        style: TextStyle(
                            color: primaryTextColor.withOpacity(0.7),
                            fontSize: 14,
                            letterSpacing: 1.01
                        ),
                      ),
                    ),
                  ),
                  CustomSpacer(width: 50,),
                  Expanded(
                    flex: 2,
                    child: Container(
                      // decoration: testDec,
                      child: Text(
                        widget.object!.note!,
                        style: TextStyle(
                            color: primaryTextColor.withOpacity(0.7),
                            fontSize: 14,
                            letterSpacing: 1.01
                        ),
                      ),
                    ),
                  ),
                  CustomSpacer(width: 50,),
                  Container(
                    // decoration: testDec,
                    child: Text(
                      "User #" + widget.object!.user!,
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
                  Container(
                    // decoration: testDec,
                    child: Text(
                      widget.object!.createdDate!.substring(0, 10),
                      style: TextStyle(
                          color: primaryTextColor.withOpacity(0.7),
                          fontSize: 14,
                          letterSpacing: 1.01
                      ),
                    ),
                  ),
                  // CustomSpacer(width: 100,),
                  // Container(
                  //   // decoration: testDec,
                  //   child: Text(
                  //     'Actions',
                  //     style: TextStyle(
                  //         color: accentColor,
                  //         fontSize: 14,
                  //         letterSpacing: 1.01
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ),

          ],
        )
    );
  }
}