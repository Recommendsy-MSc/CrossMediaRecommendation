import 'package:cross_media_recommendation/elements/CustomSpacer.dart';
import 'package:cross_media_recommendation/helper/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingElement extends StatelessWidget{
  String? text;
  TextStyle? textStyle;
  BoxDecoration? boxDecoration;

  LoadingElement({
    this.textStyle = const TextStyle(
      color: primaryColor,
      fontSize: 14,
      letterSpacing: 1.005
    ),
    this.text,
    this.boxDecoration = const BoxDecoration(
      color: primaryTextColor
    )
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: edgeInsetsAll12,
      decoration: boxDecoration,
      child: Row(
        children: [
          CircularProgressIndicator(

          ),
          CustomSpacer(width: 20,),
          Text(
            text ?? '',
            style: textStyle,
          )
        ],
      ),
    );
  }
}