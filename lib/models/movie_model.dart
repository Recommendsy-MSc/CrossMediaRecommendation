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

    }catch(e){

    }
  }




}