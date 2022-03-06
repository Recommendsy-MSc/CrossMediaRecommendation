import 'package:cross_media_recommendation/elements/CustomSpacer.dart';
import 'package:cross_media_recommendation/helper/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SidePaneMenu extends StatefulWidget{
  @override
  PageState createState() => PageState();
}

class PageState extends State<SidePaneMenu>{
  @override
  Widget build(BuildContext context) {
    return Container(

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Menu",
            style: Theme.of(context).textTheme.headline5
          ),
          CustomSpacer(height: 20,),
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Home",
                    style: Theme.of(context).textTheme.headline4
                ),
                CustomSpacer(height: 20,),
                Text(
                  "My List",
                    style: Theme.of(context).textTheme.headline4
                ),
                CustomSpacer(height: 20,),
                Text(
                  "Settings",
                    style: Theme.of(context).textTheme.headline4
                )
              ],
            )
          )
        ],
      ),
    );
  }
}