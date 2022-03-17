import 'package:cross_media_recommendation/models/basic_title_model.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:cross_media_recommendation/repositories/reports_repo.dart' as rr;
import 'package:cross_media_recommendation/repositories/global_var_repo.dart' as gr;
import 'package:cross_media_recommendation/repositories/user_repo.dart' as ur;

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
}