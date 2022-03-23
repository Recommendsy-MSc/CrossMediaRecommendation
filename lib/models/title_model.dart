import 'package:cross_media_recommendation/models/BaseModel.dart';
import 'package:cross_media_recommendation/models/genre_model.dart';
import 'package:cross_media_recommendation/models/production_company_model.dart';

import '../helper/custom_trace.dart';
import 'cast_members_model.dart';
import 'keyword_model.dart';

class TitleModel implements BaseModel{
  String? id;
  String? title;
  String? overview;
  List<GenreModel>? genres;
  int? title_type;
  List<CastModel>? cast_members;
  List<KeywordModel>? keywords;
  String? original_language;
  String? poster_path;
  List<ProductionCompanyModel>? production_companies;
  List<String>? spoken_languages;
  String? status;
  String? tagline;
  int? user_rating;


  // TV Special

  bool? in_production;
  String? last_air_date;
  String? no_episodes;
  String? no_seasons;
  String? type;

  //Movie Special
  String? backdrop_path = '';
  String? imdb_id;
  String? language;
  String? popularity;
  String? release_date = '';
  String? runtime = '';

  TitleModel.fromJson(jsonMap){
    try{
      id = jsonMap['id'] != null ? jsonMap['id'].toString() : "-1";
      title = jsonMap['title'] != null ? jsonMap['title'].toString() : "";
      overview = jsonMap['overview'] ?? '';

      genres = jsonMap['genres'] != null ? List.from(jsonMap['genres']).map((element) => GenreModel.fromJson(element)).toList() : [];
      title_type = jsonMap['title_type'] != null ? jsonMap['title_type'] : -1;
      cast_members = jsonMap['cast_members'] != null ? List.from(jsonMap['cast_members']).map((element) => CastModel.fromJson(element)).toList() : [];
      keywords = jsonMap['keywords'] != null ? List.from(jsonMap['keywords']).map((element) => KeywordModel.fromJson(element)).toList() : [];
      original_language = jsonMap['original_languages'] ?? '';
      poster_path = jsonMap['poster_path'] ?? '';
      production_companies = jsonMap['production_companies'] != null ? List.from(jsonMap['production_companies']).map((element) => ProductionCompanyModel.fromJson(element)).toList() : [];
      spoken_languages = jsonMap['spoken_languages'] != null ? List.from(jsonMap['spoken_languages']) : [];
      tagline = jsonMap['tag_line'] ?? '';
      status = jsonMap['status'] ?? '';

      user_rating = jsonMap['user_rating'] ?? 0;

      if(title_type == 0){
        backdrop_path = jsonMap['backdrop_path'] ?? '';
        imdb_id = jsonMap['imdb_id'] ?? '';
        language = jsonMap['language'] ?? '';
        popularity = jsonMap['type'] != null ? jsonMap['popularity'].toString() : '';
        release_date = jsonMap['release_date'] ?? '';
        runtime = jsonMap['runtime'] ?? '';
      }else if(title_type == 1){
        in_production = jsonMap['in_production'] != null ? jsonMap['in_production'] : false;
        last_air_date = jsonMap['last_air_date'] ?? '';
        no_episodes = jsonMap['no_episodes'] != null ? jsonMap['no_episodes'].toString() :  '';
        no_seasons = jsonMap['no_seasons'] != null ? jsonMap['no_seasons'].toString() : '';
        type = jsonMap['type'] ?? '';
      }
    }catch(e){
      // printe.toString());
      CustomTrace(StackTrace.current, message: e.toString());
    }
  }

  @override
  Map<String, dynamic> toMap(){
    // post data for patching (update)

    var m = <String, dynamic>{};
    m['title'] = title;
    m['overview'] = overview;
    // m['genres'] = genres!.map((e){
    //   return e.id;
    // }).toList();
    // m['cast_members'] = cast_members!.map((e){
    //   return e.id;
    // }).toList();
    m['tagline'] = tagline ?? "";
    m['poster_path'] = poster_path;
    m['backdrop_path'] = backdrop_path;

    return m;
  }

  static List<String> editable = ['title', 'overview', 'genres', 'cast_members', 'poster_path', 'backdrop_path', 'tagline'];

  dynamic getAttribute(name){
    switch(name){
      case 'title':
        return title;
      case 'overview':
        return overview;
      case 'genres':
        return genres;
      case 'cast_members':
        return cast_members;
      case 'poster_path':
        return poster_path;
      case 'backdrop_path':
        return backdrop_path;
      case 'tagline':
        return tagline;
    }
  }

  setAttribute(name, value){
    switch(name){
      case 'title':
        title = value;
        break;
      case 'overview':
        overview = value;
        break;
      case 'genres':
        genres = value;
        break;
      case 'cast_members':
        cast_members = value;
        break;
      case 'poster_path':
        poster_path = value;
        break;
      case 'backdrop_path':
        backdrop_path = value;
        break;
      case 'tagline':
        tagline = value;
        break;
    }
  }
}