import 'package:cross_media_recommendation/models/cast_members_model.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class TitleDetailController extends ControllerMVC{
  getStringFromList(List<CastModel> list){
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
}