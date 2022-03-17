import 'package:cross_media_recommendation/network/rest_service.dart';
import 'package:flutter/material.dart';
import 'package:cross_media_recommendation/network/APIs.dart';
import 'package:http/http.dart' as http;


Future<dynamic> getTopMovieForGenre({limit = 25, genre}) async {
  var qp = {
    'limit': limit,
  };
  if(genre != null){
    qp['genre'] = genre;
  }

  var data = await RestService.request(
    endpoint: API.top_movies,
    queryParams: qp,
  );

  return data;
}

Future<dynamic> getMovieDetail(String id) async{
  var data = await RestService.request(
    endpoint: API.movies + '/' + id
  );
  return data;
}

Future<dynamic> getRecommendations({String? id, valid = "True"}) async{
  var qp = {
    'movie_id': id!,
    'valid': valid
  };
  var data = await RestService.request(
    endpoint: API.movie_recommendations,
    queryParams: qp
  );
  return data;
}

Future<dynamic> patchData(id, postData) async{
  var endpoint = API.movies + '/' + id + '/';
  var data = await RestService.request(
    endpoint: endpoint,
    data: postData,
    method: 'PATCH'
  );

  return data;
}

Future<dynamic> invalidateMovieMovieRecom({String? movieId, String? movieId2}) async{

}