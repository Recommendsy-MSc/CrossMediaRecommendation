import 'package:cross_media_recommendation/models/cast_members_model.dart';
import 'package:cross_media_recommendation/models/keyword_model.dart';
import 'package:cross_media_recommendation/models/production_company_model.dart';
import 'package:cross_media_recommendation/models/title_model.dart';

class MovieModel extends TitleModel{
  String? backdrop_path;
  List<CastModel>? cast_members;
  String? imdb_id;
  List<KeywordModel>? keywords;
  String? language;
  String? popularity;
  String? poster_path;
  List<ProductionCompanyModel>? production_companies;
  String? release_date;
  String? runtime;
  List<String>? spoken_languages;
  String? status;
  String? tagline;

  MovieModel.fromJson(jsonMap) : super.fromJson(jsonMap){
    try{
      backdrop_path = jsonMap['backdrop_path'] ?? '';
      spoken_languages = jsonMap['spoken_languages'] != null ? List.from(jsonMap['spoken_languages']);
      cast_members = jsonMap['cast_members'] != null ? List.from(jsonMap['cast_members']).map((element) => CastModel.fromJson(element)).toList() : [];
      imdb_id = jsonMap['imdb_id'] ?? '';
      keywords = jsonMap['keywords'] != null ? List.from(jsonMap['keywords']).map((element) => KeywordModel.fromJson(element)).toList() : [];
      language = jsonMap['language'] ?? '';
      popularity = jsonMap['popularity'] ?? '';
      poster_path = jsonMap['poster_path'] ?? '';
      production_companies = jsonMap['production_companies'] != null ? List.from(jsonMap['production_companies']).map((element) => ProductionCompanyModel.fromJson(element)).toList() : [];
      release_date = jsonMap['release_date'] ?? '';
      runtime = jsonMap['runtime'] ?? '';
      status = jsonMap['status'] ?? '';
      tagline = jsonMap['tagline'] ?? '';



    }catch(e){

    }
  }




}