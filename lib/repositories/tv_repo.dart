import 'package:cross_media_recommendation/network/rest_service.dart';
import 'package:flutter/material.dart';
import 'package:cross_media_recommendation/network/APIs.dart';
import 'package:http/http.dart' as http;
import 'package:cross_media_recommendation/repositories/user_repo.dart' as ur;

Future<dynamic> createFromTMDB({tmdb_id}) async{
  var data = RestService.request(
    endpoint: API.create_tv_from_tmdb,
    queryParams: {
      'tmdb_id': tmdb_id
    },
    auth: true
  );

  return data;
}


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

Future<dynamic> invalidateTvTvRecom({String? tvId, String? tvId2}) async{
  var endpoint = API.tv_tv + API.toggle_validation;
  var data = await RestService.request(
      endpoint: endpoint,
      data: {
        'tv1': tvId,
        'tv2': tvId2
      },
      method: 'POST'
  );

  return data;
}

Future<dynamic> getTvRecomForUser({limit, genre}) async{
  var endpoinrt = API.users + '/' + ur.currentUser!.id! + API.recommend_tv;
  var qp = {
    'limit': limit
  };
  if (genre != null){
    qp['genre'] = genre;
  }
  var data = await RestService.request(
      endpoint: endpoinrt,
      queryParams: qp,
      auth: ur.loggedIn
  );

  return data;
}

Future<dynamic> likeTv(String? tvId) async{
  var endpoint = API.tv + '/' + tvId! + API.like;
  var data = await RestService.request(
      endpoint: endpoint,
      data: {
        'user_id': ur.currentUser!.id!
      },
      method: 'POST',
      auth: true
  );
  return data;
}

Future<dynamic> dislikeTv(String? tvId) async{
  var endpoint = API.tv + '/' + tvId! + API.dislike;
  var data = await RestService.request(
      endpoint: endpoint,
      data: {
        'user_id': ur.currentUser!.id!
      },
      method: 'POST',
      auth: true
  );
  return data;
}

Future<dynamic> reportMissingTvTitle({String? name}) async{
  var data = await RestService.request(
    endpoint: API.missing_title,
    data: {
      'user': ur.currentUser!.id,
      'title': name!,
      'title_type': 1

    },
    method: 'POST'
  );

  return data;
}

Future<dynamic> patchData(id, postData) async{
  var endpoint = API.tv + '/' + id + '/';
  var data = await RestService.request(
    endpoint: endpoint,
    data: postData,
    method: 'PATCH',
    // auth: ur.loggedIn
  );

  return data;
}
