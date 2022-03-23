import 'package:cross_media_recommendation/helper/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonComponent extends StatelessWidget{
  String? title;
  Function? onClick;
  TextStyle textStyle;
  BoxDecoration boxDecoration;

  ButtonComponent({Key? key,
    required this.title,
    required this.onClick,
    this.textStyle = const TextStyle(
        fontSize: 16,
        color: accentColor,
        letterSpacing: 1.01
    ),
    this.boxDecoration = const BoxDecoration()
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onClick!();
      },
      child: Container(
        // padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: boxDecoration,
        child: Text(
          title!,
          style: textStyle
        ),
      ),
    );
  }
}