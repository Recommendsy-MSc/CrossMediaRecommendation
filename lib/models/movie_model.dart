import 'package:cross_media_recommendation/models/cast_members_model.dart';
import 'package:cross_media_recommendation/models/keyword_model.dart';
import 'package:cross_media_recommendation/models/production_company_model.dart';
import 'package:cross_media_recommendation/models/title_model.dart';

class MovieModel extends TitleModel{
  MovieModel.fromJson(jsonMap) : super.fromJson(jsonMap){}
}