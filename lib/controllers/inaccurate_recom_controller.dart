import 'package:cross_media_recommendation/models/reports_models/inaccurate_recom_model.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:cross_media_recommendation/repositories/movie_repo.dart' as mr;
import 'package:cross_media_recommendation/repositories/tv_repo.dart' as tr;
import 'package:cross_media_recommendation/repositories/reports_repo.dart' as rr;

class InaccurateRecomController extends ControllerMVC{
  InaccurateRecomModel? model;
  bool processing = false;
  Future<bool> markAsDone() async{
    bool success = false;
    setState(() {
      processing = true;
    });
    if(model!.type == 0){
      if(model!.recommendedType == 0){
        success = await mr.invalidateMovieMovieRecom(movieId: model!.title, movieId2: model!.recommendedTitle);
      }else if(model!.recommendedType == 1){
        success = await mr.invalidateMovieTvRecom(movieId: model!.title, tvId: model!.recommendedTitle);
      }
    }else if(model!.type == 1){
      if(model!.recommendedType == 0){
        success = await mr.invalidateMovieTvRecom(movieId: model!.title, tvId: model!.recommendedTitle);
      }else if(model!.recommendedType == 1){
        success = await tr.invalidateTvTvRecom(tvId: model!.title, tvId2: model!.recommendedTitle);
      }
    }
    if(success){
      success = await rr.markInaccurateRecomAsCompleted(model!.id);
      if(success){
        model!.active = false;
        setState(() {
          processing = false;
        });
      }
    }
    return success;
  }
}