import 'package:cross_media_recommendation/elements/MissingTitleReportTile.dart';
import 'package:cross_media_recommendation/elements/SuggestedTitleTile.dart';
import 'package:cross_media_recommendation/helper/constants.dart';
import 'package:cross_media_recommendation/models/reports_models/broken_link_model.dart';
import 'package:cross_media_recommendation/models/reports_models/inaccurate_data_model.dart';
import 'package:cross_media_recommendation/models/reports_models/inaccurate_recom_model.dart';
import 'package:cross_media_recommendation/models/reports_models/missing_title_model.dart';
import 'package:cross_media_recommendation/models/suggested_title_model.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:cross_media_recommendation/repositories/user_repo.dart' as ur;
import 'package:cross_media_recommendation/repositories/global_var_repo.dart' as gr;
import 'package:cross_media_recommendation/repositories/reports_repo.dart' as rr;
import 'package:cross_media_recommendation/repositories/search_repo.dart' as sr;
import 'package:cross_media_recommendation/repositories/movie_repo.dart' as mr;
import 'package:cross_media_recommendation/repositories/tv_repo.dart' as tr;

import '../elements/Loader.dart';


class ReportsPageController extends ControllerMVC{
  bool activeReports = true;
  List<InaccurateRecomModel> recomList = [];
  List<InaccurateDataModel> dataList = [];
  List<BrokenLinkModel> brokenLinkList = [];
  List<MissingTitleModel> missingTitlesList = [];
  List<SuggestedTitleModel> suggestedTitlesList = [];
  bool showSuggestedPreview = false;
  SuggestedTitleModel? previewModel;



  int currentReports = 0;
  Future<void> logoutUser() async{
    await ur.logout();
    // gr.bodyMainController!.toggleSidePane();
    // gr.homePageController!.setState(() { });
    Navigator.of(state!.context).pushNamedAndRemoveUntil('/HomePage', (route) => false);
  }

  void reload(){
    switchReports(currentReports);
  }

  void switchReports(index) async{
    // // printcurrentReports);
    currentReports = index;
    setState(() { });
    gr.showLoader(state!.context);
    switch(index){
      case 0:
        await fetchInaccurateRecommendationsReports();
        break;
      case 1:
        await fetchInaccurateDataReports();
        break;
      case 2:
        // await fetchBrokenLinkReports();
        await fetchMissingTitleReports();
        break;
    }
    gr.hideLoader(state!.context);

    setState(() {
      // print"setting state");
    });
  }

  void switchActive(){
    activeReports = !activeReports;
    switchReports(currentReports);
  }

  Future<void> fetchMissingTitleReports() async{
    missingTitlesList = [];
    var data = await rr.fetchMissingTitles(active: activeReports);
    data['data'].forEach((element){
      missingTitlesList.add(MissingTitleModel.fromJson(element));
    });

  }

  Future<void> fetchInaccurateRecommendationsReports() async{
    recomList = [];
    var data = await rr.getInaccurateRecomReports(active: activeReports);
    data.forEach((element){
      recomList.add(InaccurateRecomModel.fromJson(element));
    });
  }

  Future<void> fetchInaccurateDataReports() async{
    dataList = [];
    var data = await rr.getInaccurateDataReports(active: activeReports);
    data.forEach((element){
      dataList.add(InaccurateDataModel.fromJson(element));
    });
  }

  Future<void> fetchBrokenLinkReports() async{
    brokenLinkList = [];
    var data = await rr.getBrokenLinkReports(active: activeReports);
    data.forEach((element){
      brokenLinkList.add(BrokenLinkModel.fromJson(element));
    });
  }

  Future<void> fetchSuggestionsForMissing({search_string, type=0}) async{
    suggestedTitlesList = [];
    dynamic data;
    if(type == 0){
      data = await sr.searchTbdbMovie(search_string);
    }else{
      data = await sr.searchTbdbTv(search_string);
    }
    data['data']['result'].forEach((element){
      suggestedTitlesList.add(SuggestedTitleModel.fromJson(element));
    });
    setState(() { });
  }

  void switchSuggestedTitlePreview(object){
    previewModel = object;
    showSuggestedPreview = true;
    setState(() { });
  }

  Future<void> addTitleForMissingReport({report_id}) async{
    bool success = false;
    if(previewModel!.title_type == 0){
      var data = await mr.createFromTMDB(tmdb_id: previewModel!.id);
      success = data['success'];
    }else if(previewModel!.title_type == 1){
      var data = await tr.createFromTMDB(tmdb_id: previewModel!.id);
      success = data['success'];
    }

    if(success) {
      var data = await rr.markMissingTitleAsCompleted(report_id, previewModel!.id);
      Navigator.of(state!.context).pop();
    }
  }
}