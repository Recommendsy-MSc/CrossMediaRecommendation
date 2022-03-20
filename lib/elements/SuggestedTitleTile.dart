import 'package:cross_media_recommendation/models/suggested_title_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../helper/constants.dart';
import 'CustomSpacer.dart';

class SuggestedTitleTile extends StatefulWidget{
  SuggestedTitleModel? object;
  Function showPreviewCallback;

  SuggestedTitleTile({required this.object, required this.showPreviewCallback});
  @override
  PageState createState() => PageState();
}

class PageState extends State<SuggestedTitleTile>{

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
                      widget.showPreviewCallback(widget.object);
                    },
                    child: Container(
                      width: 100,
                      // decoration: testDec,
                      child: Text(
                        "#" + widget.object!.id!,
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
                        widget.object!.title!,
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
            Container(
              // decoration: testDec,
              child: Row(
                children: [
                  Container(
                    // decoration: testDec,
                    child: Text(
                      widget.object!.release_date!,
                      style: TextStyle(
                          color: primaryTextColor.withOpacity(0.7),
                          fontSize: 14,
                          letterSpacing: 1.01
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