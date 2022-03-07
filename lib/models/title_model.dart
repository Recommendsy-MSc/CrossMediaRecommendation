import 'package:cross_media_recommendation/models/genre_model.dart';

class TitleModel{
  String? id;
  String? title;
  String? overview;
  List<GenreModel>? genres;

  int? model_type;

  TitleModel.fromJson(jsonMap){
    try{
      id = jsonMap['id'] != null ? jsonMap['id'].toString() : "-1";
      title = jsonMap['title'] != null ? jsonMap['title'].toString() : "";
      overview = jsonMap['overview'] ?? '';
      genres = jsonMap['genres'] != null ? List.from(jsonMap['genres']).map((element) => GenreModel.fromJson(element)).toList() : [];
    }catch(e){
      print(e.toString());
      // CustomTrace(StackTrace.current, message: e.toString());
    }
  }
}