import 'dart:convert';

import 'package:cross_media_recommendation/models/BaseModel.dart';
import 'package:cross_media_recommendation/models/genre_model.dart';

class SuggestedTitleModel implements BaseModel{
  String? id;
  String? title;
  String? backdrop_path;
  String? poster_path;
  int? title_type;
  String? overview;
  List<GenreModel>? genres;
  String? release_date;

  SuggestedTitleModel.fromJson(jsonMap){
    try{
      id = jsonMap['id'] != null ? jsonMap['id'].toString() : "";
      title = jsonMap['title'] ?? "";
      title_type = jsonMap['title_type'] ?? 0;
      backdrop_path = jsonMap['backdrop_path'] ?? '';
      poster_path = jsonMap['poster_path'] ?? '';
      overview = jsonMap['overview'] ?? '';
      genres = jsonMap['genres'] != null ? List.from(jsonMap['genres']).map((element) => GenreModel.fromJson(element)).toList() : [];
      if(title_type == 1){
        release_date = jsonMap['first_air_date'] ?? '';
      }else{
        release_date = jsonMap['release_date'] ?? '';
      }
    }
    catch(e){
      // printe);
    }
  }

  @override
  Map<String, dynamic> toMap(){
    var m = <String, dynamic>{};
    return m;
  }
}