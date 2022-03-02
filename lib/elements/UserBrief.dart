import 'package:cross_media_recommendation/helper/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserBrief extends StatefulWidget{
  @override
  PageState createState() => PageState();
}

class PageState extends State<UserBrief>{
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: edgeInsetsAll8,
          decoration: BoxDecoration(
            borderRadius: borderRadius12
          ),
          child: Icon(
            Icons.account_circle_rounded,
            size: MediaQuery.of(context).size.width * 0.05,
          ),
        ),
        Container(
          child: Text("Mahershi Bhavsar")
        )
      ],
    );
  }
}