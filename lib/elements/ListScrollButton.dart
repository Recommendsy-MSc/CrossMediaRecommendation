import 'package:cross_media_recommendation/elements/CustomSpacer.dart';
import 'package:cross_media_recommendation/helper/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ListScrollButton extends StatefulWidget{

  Function nextPageCB;
  Function prevPageCB;

  ListScrollButton({Key? key, required this.nextPageCB, required this.prevPageCB}) : super(key: key);

  @override
  PageState createState () => PageState();
}

class PageState extends State<ListScrollButton>{
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: (){
            widget.prevPageCB();
          },
          child: Container(
            padding: edgeInsetsAll8,
            decoration: BoxDecoration(
              color: accentColor,
              borderRadius: borderRadius12
            ),
            child: Icon(Icons.chevron_left, color: white,)
          ),
        ),
        CustomSpacer(height: 0, width: 10,),
        InkWell(
          onTap: (){
            widget.nextPageCB();
          },
          child: Container(
            padding: edgeInsetsAll8,
            decoration: BoxDecoration(
                color: accentColor,
                borderRadius: borderRadius12
            ),
            child: Icon(Icons.chevron_right, color: white,)
          ),
        )
      ],
    );
  }
}