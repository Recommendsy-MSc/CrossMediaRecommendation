import 'package:cross_media_recommendation/elements/AppTitle.dart';
import 'package:cross_media_recommendation/elements/SearchBar.dart';
import 'package:cross_media_recommendation/helper/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'ProfileIcon.dart';

class TopNav extends StatefulWidget{
  Function onSubmitCallback;
  TopNav({Key? key, required this.onSubmitCallback}) : super(key: key);

  @override
  PageState createState () => PageState();
}



class PageState extends State<TopNav>{
  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: testDec,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SearchBar(onSubmitCallback: widget.onSubmitCallback,),
          ProfileIcon()
        ],
      ),
    );
  }
}