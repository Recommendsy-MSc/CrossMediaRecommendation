import 'package:cross_media_recommendation/elements/CustomDialog.dart';
import 'package:cross_media_recommendation/elements/ReportDialog.dart';
import 'package:flutter/material.dart';

class ReportDialogDef extends CustomDialog{
  dynamic data;
  String? name;

  ReportDialogDef({this.name, this.data});

  @override
  dynamic getData() {
    return data;
  }

  @override
  String getTitle() {
    return name!;
  }

  @override
  Widget dialogDesign(BuildContext context) {
    return ReportDialog(name: getTitle(), titleModel: getData());
  }
}