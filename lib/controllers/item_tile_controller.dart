import 'package:cross_media_recommendation/models/basic_title_model.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:cross_media_recommendation/repositories/reports_repo.dart' as rr;
import 'package:cross_media_recommendation/repositories/global_var_repo.dart' as gr;
import 'package:cross_media_recommendation/repositories/user_repo.dart' as ur;
import 'package:cross_media_recommendation/repositories/movie_repo.dart' as mr;
import 'package:cross_media_recommendation/repositories/tv_repo.dart' as tr;

class ItemTileController extends ControllerMVC{
  BasicTitleModel? basicTitleModel;
  Future<void> reportInaccurateRecommendation() async{
    var data ={
      'user_id': ur.currentUser!.id,
      'recommended_title': basicTitleModel!.id,
      'recommended_type': basicTitleModel!.title_type
    };

    if(gr.currentTitle!.title_type == 0){
      await rr.reportInaccurateRecommendationForMovie(gr.currentTitle!.id!, data);
    }else if(gr.currentTitle!.title_type == 1){
      await rr.reportInaccurateRecommendationForTv(gr.currentTitle!.id!, data);
    }
  }

  Future<void> dislike() async{
    dynamic? resp;
    if(basicTitleModel!.title_type == 0) {
      resp = await mr.dislikeMovie(basicTitleModel!.id);
    }
    else if(basicTitleModel!.title_type == 1){
      resp = await tr.dislikeTv(basicTitleModel!.id);
    }
    if(resp['success']){
      basicTitleModel!.user_rating = 1;
      setState(() {
        print('setting tile sttae');
      });
    }

  }

  Future<void> like() async{
    dynamic? resp;
    if(basicTitleModel!.title_type == 0) {
      resp = await mr.likeMovie(basicTitleModel!.id);
    }
    else if(basicTitleModel!.title_type == 1){
      resp = await tr.likeTv(basicTitleModel!.id);
    }
    if(resp['success']){
      basicTitleModel!.user_rating = 5;
      setState(() {
        print('setting tile sttae');
      });
    }
  }
}