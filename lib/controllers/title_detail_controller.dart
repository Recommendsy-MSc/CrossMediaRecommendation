import 'package:cross_media_recommendation/models/cast_members_model.dart';
import 'package:cross_media_recommendation/models/title_model.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:cross_media_recommendation/repositories/movie_repo.dart' as mr;

class TitleDetailController extends ControllerMVC{
  TitleModel? titleModel;
  String getStringFromList(List<CastModel> list){
    String s = '';

    for(CastModel item in list){
      if(list.first == item){
        s += item.name!;
      }else{
        s += ', ' + item.name!;
      }
    }

    return s;
  }

  Future<void> dislike() async{
    dynamic? resp;
    if(titleModel!.title_type == 0) {
      resp = await mr.dislikeMovie(titleModel!.id);
    }
    else{

    }
    if(resp['success']){
      titleModel!.user_rating = 1;
      setState(() { });
    }

  }

  Future<void> like() async{
    dynamic? resp;
    if(titleModel!.title_type == 0) {
      resp = await mr.likeMovie(titleModel!.id);
    }
    else{

    }
    if(resp['success']){
      titleModel!.user_rating = 5;
      setState(() { });
    }
  }
}