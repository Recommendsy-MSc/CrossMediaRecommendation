import 'package:cross_media_recommendation/helper/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileIcon extends StatefulWidget{
  @override
  PageState createState() => PageState();
}

class PageState extends State<ProfileIcon>{
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: accentColor),
        borderRadius: BorderRadius.circular(100)
      ),
      padding: EdgeInsets.all(0.5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Icon(
          Icons.account_circle_rounded,
          color: accentColor,
          size: 48,
        ),
      ),
    );
  }
}