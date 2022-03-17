import 'package:cross_media_recommendation/models/basic_title_model.dart';
import 'package:cross_media_recommendation/models/title_model.dart';
import 'package:cross_media_recommendation/network/APIs.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:cross_media_recommendation/repositories/movie_repo.dart' as mr;
import 'package:cross_media_recommendation/repositories/tv_repo.dart' as tv;

class TitleController extends ControllerMVC{
  bool titleLoaded = false;
  TitleModel? titleModel;
  bool loadedRecom = false;
  Map<String, dynamic>? recom_data;


  Future<void> fetchTitleDetails(BasicTitleModel model) async {
    var data = {};
    titleLoaded = false;
    switch(model.title_type){
      case 0:
        data = await mr.getMovieDetail(model.id!);
        break;
      case 1:
        data = await tv.getTvDetail(model.id!);
        break;
    }
    titleModel = TitleModel.fromJson(data['data']);
    setState(() {
      titleLoaded = true;
    });
  }

  Future<void> fetchRecommendations(BasicTitleModel model) async{
    loadedRecom = false;
    switch(model.title_type){
      case 0:
        recom_data = (await mr.getRecommendations(id: model.id!))['data'];
        break;
      case 1:
        recom_data = (await tv.getRecommendations(id: model.id!))['data'];
        break;
    }
    setState(() {
      loadedRecom = true;
    });
  }


}

