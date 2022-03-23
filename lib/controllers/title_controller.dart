import 'package:cross_media_recommendation/models/basic_title_model.dart';
import 'package:cross_media_recommendation/models/title_model.dart';
import 'package:cross_media_recommendation/network/APIs.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:cross_media_recommendation/repositories/movie_repo.dart' as mr;
import 'package:cross_media_recommendation/repositories/tv_repo.dart' as tv;

class TitleController extends ControllerMVC{
  bool titleLoaded = false;
  TitleModel? titleModel;
  bool loadedRecom = false;
  Map<String, dynamic>? recom_data = {};

  void loadData({BasicTitleModel? model, Map<String, dynamic>? qp}){
    if(model == null){
      print("no model");
      if(qp!['id'] == null || qp['type'] == null){
        Navigator.of(state!.context).pushNamedAndRemoveUntil('/HomePage', (route) => false);
      }
      else{
        fetchTitleDetails(title_type: int.parse(qp['type']), title_id: qp['id']);
        fetchRecommendations(title_type: int.parse(qp['type']), title_id: qp['id']);
      }

    }else{
      print("has model");
      fetchTitleDetails(title_type: model.title_type, title_id: model.id);
      fetchRecommendations(title_type: model.title_type, title_id: model.id);
    }
  }

  Future<void> fetchTitleDetails({title_id, title_type}) async {
    print("Fetching using model: " + title_id + " " + title_type.toString());
    var data = {};
    setState(() {
      titleLoaded = false;
    });
    switch(title_type){
      case 0:
        data = await mr.getMovieDetail(title_id!);
        break;
      case 1:
        data = await tv.getTvDetail(title_id!);
        break;
    }
    print(data);
    titleModel = TitleModel.fromJson(data['data']);
    print(titleModel!.title);
    setState(() {
      titleLoaded = true;
    });
  }

  Future<void> fetchRecommendations({title_id, title_type}) async{
    loadedRecom = false;
    switch(title_type){
      case 0:
        recom_data = (await mr.getRecommendations(id: title_id!))['data'];
        break;
      case 1:
        recom_data = (await tv.getRecommendations(id: title_id!))['data'];
        break;
    }
    setState(() {
      loadedRecom = true;
    });
  }


}

