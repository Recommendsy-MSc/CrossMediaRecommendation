import 'package:cross_media_recommendation/helper/constants.dart';
import 'package:cross_media_recommendation/models/title_model.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:cross_media_recommendation/repositories/reports_repo.dart' as rr;
import 'package:cross_media_recommendation/repositories/user_repo.dart' as ur;
import 'package:cross_media_recommendation/repositories/movie_repo.dart' as mr;
import 'package:cross_media_recommendation/repositories/tv_repo.dart' as tr;
import 'package:cross_media_recommendation/repositories/global_var_repo.dart' as gr;

import '../elements/Loader.dart';

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

  Future<bool> reportInaccurateData() async{
    var data = {
      'note': textController.text,
      'type': titleModel!.title_type!,
      'user_id': ur.currentUser!.id
    };

    // Show Loader
    gr.showLoader(state!.context);
    bool success = false;
    if(titleModel!.title_type == 0){
      success = await rr.reportInaccurateDataForMovie(titleModel!.id!, data);
    }else if(titleModel!.title_type == 1){
      success = await rr.reportInaccurateDataForTv(titleModel!.id!, data);
    }

    // To Remove Loader
    gr.hideLoader(state!.context);
    return success;
  }

  Future<void> reportMissingTitle() async {
    gr.showLoader(state!.context);

    if(seletecTitleTypeMovie){
      await mr.reportMissingMovieTitle(name: textController.text);
    }else{
      await tr.reportMissingTvTitle(name: textController.text);
    }
    gr.hideLoader(state!.context);

  }
}