import 'package:cross_media_recommendation/models/cast_members_model.dart';
import 'package:cross_media_recommendation/models/keyword_model.dart';
import 'package:cross_media_recommendation/models/production_company_model.dart';
import 'package:cross_media_recommendation/models/title_model.dart';

class TvModel extends TitleModel{
  List<CastModel>? cast_model;
  String? status;
  String? tagline;
  bool? in_production;
  List<KeywordModel>? keywords;
  String? last_air_date;
  String? no_episodes;
  String? no_seasons;
  String? original_language;
  String? poster_path;
  List<ProductionCompanyModel>? production_companies;
  List<String>? spoken_languages;
  String? type;

  TvModel.fromJson(jsonMap) : super.fromJson(jsonMap){
    try{

    }
    catch(e){

    }
  }
}