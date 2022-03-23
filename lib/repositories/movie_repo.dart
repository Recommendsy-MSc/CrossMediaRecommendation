import 'package:cross_media_recommendation/network/rest_service.dart';
import 'package:flutter/material.dart';
import 'package:cross_media_recommendation/network/APIs.dart';
import 'package:http/http.dart' as http;
import 'package:cross_media_recommendation/repositories/user_repo.dart' as ur;

Future<dynamic> createFromTMDB({tmdb_id}) async{
  var data = RestService.request(
      endpoint: API.create_movie_from_tmdb,
      queryParams: {
        'tmdb_id': tmdb_id
      },
      auth: true
  );

  return data;
}

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
    auth: ur.loggedIn
  );
  return data;
}

Future<dynamic> getMovieDetail(String id) async{
  var data = await RestService.request(
    endpoint: API.movies + '/' + id,
    auth: ur.loggedIn
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
    queryParams: qp,
    auth: ur.loggedIn
  );
  return data;
}

Future<dynamic> patchData(id, postData) async{
  var endpoint = API.movies + '/' + id + '/';
  var data = await RestService.request(
    endpoint: endpoint,
    data: postData,
    method: 'PATCH',
    // auth: ur.loggedIn
  );

  return data;
}

Future<dynamic> invalidateMovieMovieRecom({String? movieId, String? movieId2}) async{
  var endpoint = API.movie_movie + API.toggle_validation;
  var data = await RestService.request(
    endpoint: endpoint,
    data: {
      'movie1': movieId,
      'movie2': movieId2
    },
    method: 'POST'
  );

  return data;
}

Future<dynamic> invalidateMovieTvRecom({String? movieId, String? tvId}) async{
  var endpoint = API.movie_tv + API.toggle_validation;
  var data = await RestService.request(
      endpoint: endpoint,
      data: {
        'movie': movieId,
        'tv': tvId
      },
      method: 'POST'
  );

  return data;
}

Future<dynamic> likeMovie(String? movieId) async{
  var endpoint = API.movies + '/' + movieId! + API.like;
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

Future<dynamic> dislikeMovie(String? movieId) async{
  var endpoint = API.movies + '/' + movieId! + API.dislike;
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

Future<dynamic> getMovieRecomForUser({limit, genre}) async{
  var endpoinrt = API.users + '/' + ur.currentUser!.id! + API.recommend_movies;
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

Future<dynamic> reportMissingMovieTitle({String? name}) async{
  var data = await RestService.request(
      endpoint: API.missing_title,
      data: {
        'user': ur.currentUser!.id,
        'title': name!,
        'title_type': 0
      },
      method: 'POST'
  );

  return data;
}