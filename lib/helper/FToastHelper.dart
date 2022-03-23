import 'package:cross_media_recommendation/helper/constants.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomToast{
  BuildContext? context;
  String? msg;
  FToast? fToast;
  Color? msgColor;
  Duration duration;

  CustomToast({this.context, this.msg, this.msgColor = primaryColor, this.duration=const Duration(milliseconds: 1500)}){
    fToast = FToast();
    fToast!.init(context!);
  }

  showToast(){
    if (msg != null || msg != "") {
      fToast!.showToast(
          child: getToastWidget(),
          gravity: ToastGravity.TOP,
          toastDuration: duration);
    }
  }

  Container getToastWidget(){
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: borderRadius12,
            color: primaryTextColor.withOpacity(0.85)
        ),
        child: Text(
          msg ?? "",
          style: TextStyle(
              fontSize: 14,
              color: msgColor,
              letterSpacing: 1.01,

          ),
        )
    );
  }


}