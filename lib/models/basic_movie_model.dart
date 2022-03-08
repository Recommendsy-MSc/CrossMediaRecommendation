import 'package:cross_media_recommendation/models/basic_title_model.dart';

class BasicMovieModel extends BasicTitleModel{
  // String? id;
  // String? title;
  // String? poster_path;
  // int title_type = 0;
  //
  BasicMovieModel.fromJson(jsonMap) : super.fromJson(jsonMap){}
  //
  // Map toMap(){
  //   var m = Map<String, dynamic>();
  //   m['id'] = int.parse(id!);
  //   m['title'] = title!;
  //   m['poster_path'] = poster_path!;
  //
  //   return m;
  // }
}