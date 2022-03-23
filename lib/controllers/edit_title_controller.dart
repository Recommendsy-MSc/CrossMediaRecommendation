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
    if (titleModel!.title_type == 0){
      var resp = await mr.patchData(titleModel!.id!, titleModel!.toMap());
    }else{
      var resp = await tv.patchData(titleModel!.id!, titleModel!.toMap());
    }
  }

  Future<void> markReportAsResolved() async{
    await rr.markInaccurateDataReportAsCompleted(reportId);
    Navigator.of(state!.context).pop();
  }
}