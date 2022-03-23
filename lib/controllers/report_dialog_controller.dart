import 'package:cross_media_recommendation/models/title_model.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:cross_media_recommendation/repositories/reports_repo.dart' as rr;
import 'package:cross_media_recommendation/repositories/user_repo.dart' as ur;
import 'package:cross_media_recommendation/repositories/movie_repo.dart' as mr;
import 'package:cross_media_recommendation/repositories/tv_repo.dart' as tr;

class ReportDialogController extends ControllerMVC{
  TitleModel? titleModel;
  bool selectedReportType = false;
  final formKey = GlobalKey<FormState>();
  TextEditingController textController = TextEditingController();

  // for missing title
  bool seletecTitleTypeMovie = true;

  void switchTitleType({movie = true}){
    seletecTitleTypeMovie = movie;
    setState(() { });
  }

  Future<void> reportBrokenLink() async{
    // printtitleModel!.title_type);
    // printtitleModel!.title);
    if(titleModel!.title_type == 0){
      await rr.reportBrokenLinkForMovie(titleModel!.id!);
    }else if(titleModel!.title_type == 1){
      await rr.reportBrokenLinkForTv(titleModel!.id!);
    }
  }

  Future<void> reportInaccurateData() async{
    var data = {
      'note': textController.text,
      'type': titleModel!.title_type!,
      'user_id': ur.currentUser!.id
    };
    if(titleModel!.title_type == 0){
      await rr.reportInaccurateDataForMovie(titleModel!.id!, data);
    }else if(titleModel!.title_type == 1){
      await rr.reportInaccurateDataForTv(titleModel!.id!, data);
    }
  }

  Future<void> reportMissingTitle() async {
    if(seletecTitleTypeMovie){
      await mr.reportMissingMovieTitle(name: textController.text);
    }else{
      await tr.reportMissingTvTitle(name: textController.text);
    }
  }
}