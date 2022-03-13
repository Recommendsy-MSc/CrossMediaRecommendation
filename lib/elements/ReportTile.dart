import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../helper/constants.dart';
import 'CustomSpacer.dart';

class ReportTile extends StatefulWidget{
  @override
  PageState createState() => PageState();
}

class PageState extends StateMVC<ReportTile>{
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
          Container(
            // decoration: testDec,
            child: Text(
              "Spider-Man: No Way Home",
              style: TextStyle(
                color: primaryTextColor.withOpacity(0.7),
                fontSize: 14,
                letterSpacing: 1.01
              ),
            ),
          ),
          Container(
            // decoration: testDec,
            child: Row(
              children: [
                Container(
                  // decoration: testDec,
                  child: Text(
                    "Mar-02-2022",
                    style: TextStyle(
                        color: primaryTextColor.withOpacity(0.7),
                        fontSize: 14,
                        letterSpacing: 1.01
                    ),
                  ),
                ),
                CustomSpacer(width: 150,),
                Container(
                  // decoration: testDec,
                  child: Text(
                    "32",
                    style: TextStyle(
                        color: primaryTextColor.withOpacity(0.7),
                        fontSize: 14,
                        letterSpacing: 1.01
                    ),
                  ),
                ),
                CustomSpacer(width: 150,),
                Container(
                  // decoration: testDec,
                  child: Text(
                    'Actions',
                    style: TextStyle(
                        color: accentColor,
                        fontSize: 14,
                        letterSpacing: 1.01
                    ),
                  ),
                )
              ],
            ),
          ),

        ],
      )
    );
  }
}