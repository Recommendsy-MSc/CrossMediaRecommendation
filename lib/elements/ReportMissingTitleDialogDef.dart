import 'package:cross_media_recommendation/elements/CustomDialog.dart';
import 'package:cross_media_recommendation/elements/ReportMissionTitle.dart';
import 'package:flutter/cupertino.dart';

class ReportMissingTitleDialogDef extends CustomDialog{
  @override
  String getTitle() {
    return 'Report Missing Title';
  }

  @override
  Widget dialogDesign(BuildContext context){
    return ReportMissingTitle();
  }

  @override
  getData() {
    return null;
  }
}