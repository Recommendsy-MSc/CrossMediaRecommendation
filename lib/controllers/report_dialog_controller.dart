import 'package:cross_media_recommendation/models/title_model.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:cross_media_recommendation/repositories/reports_repo.dart' as rr;
import 'package:cross_media_recommendation/repositories/user_repo.dart' as ur;

class ReportDialogController extends ControllerMVC{
  TitleModel? titleModel;
  bool selectedReportType = false;
  final formKey = GlobalKey<FormState>();
  TextEditingController textController = TextEditingController();

  Future<void> reportBrokenLink() async{
    print(titleModel!.title_type);
    print(titleModel!.title);
    if(titleModel!.title_type == 0){
      await rr.reportBrokenLinkForMovie(titleModel!.id!);
    }else if(titleModel!.title_type == 1){
      await rr.reportBrokenLinkForTv(titleModel!.id!);
    }
  }

  Future<void> reportInaccurateData() async{
    var data = {
      'user_id': ur.currentUser!.id,
      'note': textController.text
    };
    if(titleModel!.title_type == 0){
      await rr.reportInaccurateDataForMovie(titleModel!.id!, data);
    }else if(titleModel!.title_type == 1){
      await rr.reportInaccurateDataForTv(titleModel!.id!, data);
    }
  }
}