import 'package:cross_media_recommendation/helper/FToastHelper.dart';
import 'package:cross_media_recommendation/models/title_model.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:cross_media_recommendation/repositories/movie_repo.dart' as mr;
import 'package:cross_media_recommendation/repositories/tv_repo.dart' as tv;
import 'package:cross_media_recommendation/repositories/reports_repo.dart' as rr;
import 'package:cross_media_recommendation/repositories/global_var_repo.dart' as gr;

class EditTitleController extends ControllerMVC{
  bool titleLoaded = false;
  TitleModel? titleModel;
  String? reportId;

  Future<void> fetchTitleDetail(customData) async{
    reportId = customData['reportId'];
    var data = {};
    if(customData['type'] == 0){
      data = await mr.getMovieDetail(customData['id']);

    }else if(customData['type'] == 1){
      data = await tv.getTvDetail(customData['id']);
    }

    titleModel = TitleModel.fromJson(data['data']);
    setState(() {
      titleLoaded = true;
    });
  }

  void refresh(){
    setState(() { });
  }


  // Maybe do it later
  void showEditDialog(context, name, value){

  }

  Future<void> patchNewData() async{
    var success = false;
    if (titleModel!.title_type == 0){
      success = await mr.patchData(titleModel!.id!, titleModel!.toMap());
    }else{
      success = await tv.patchData(titleModel!.id!, titleModel!.toMap());
    }
    if(success) {
      CustomToast(msg: "Title Updated!", context: state!.context).showToast();
    }

  }

  Future<void> markReportAsResolved() async{
    var success = await rr.markInaccurateDataReportAsCompleted(reportId);
    if(success){
      Navigator.of(state!.context).pop(true);
    }

  }
}