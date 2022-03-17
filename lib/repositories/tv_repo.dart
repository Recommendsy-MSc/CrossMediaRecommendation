import 'package:cross_media_recommendation/network/rest_service.dart';
import 'package:flutter/material.dart';
import 'package:cross_media_recommendation/network/APIs.dart';
import 'package:http/http.dart' as http;


Future<dynamic> getTopTvForGenre({limit = 25, genre}) async {
  var qp = {
    'limit': limit,
  };
  if(genre != null){
    qp['genre'] = genre;
  }

  var data = RestService.request(
    endpoint: API.top_tv,
    queryParams: qp,
  );

  return data;
}

Future<dynamic> getTvDetail(String id) async{
  var data = RestService.request(
      endpoint: API.tv + '/' + id
  );
  return data;
}


Future<dynamic> getRecommendations({String? id, valid = 'True'}) async{
  var qp = {
    'tv_id': id!,
    'valid': valid
  };
  var data = RestService.request(
    endpoint: API.tv_recommendations,
    queryParams: qp
  );
  return data;
}