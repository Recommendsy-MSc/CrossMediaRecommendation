import 'package:cross_media_recommendation/elements/AppTitle.dart';
import 'package:cross_media_recommendation/elements/UserBrief.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeSidePane extends StatefulWidget{
  HomeSidePane({Key? key}) : super(key: key);

  @override
  PageState createState() => PageState();
}

class PageState extends State<HomeSidePane>{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppTitle(),
            // UserBrief(),
            // Container(
            //   child: Icon(
            //     Icons.menu
            //   )
            // )
          ],
        ),
      ],
    );
  }
}