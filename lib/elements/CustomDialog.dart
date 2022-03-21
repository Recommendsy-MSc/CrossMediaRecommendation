import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class CustomDialog{
  dynamic getData();
  String getTitle();
  Widget dialogDesign(BuildContext context);

  Future<dynamic> show(BuildContext context) async{
    return showDialog(
      context: context,
      builder: (context){
        return dialogDesign(context);
      }
    );
  }
}