import 'package:cross_media_recommendation/network/APIs.dart';
import 'package:cross_media_recommendation/network/rest_service.dart';

Future<dynamic> searchString(search_string) async{
  var data = await RestService.request(
    endpoint: API.search,
    queryParams: {
      'q': search_string,
      'order_by': '-popularity'
    },
    auth: true
  );

  return data;
}

Future<dynamic> searchTbdbMovie(search_string) async{
  var data = await RestService.request(
    endpoint: API.search_tmdb_movie,
    queryParams: {
      'q': search_string
    },
    auth: true
  );

  return data;
}

Future<dynamic> searchTbdbTv(search_string) async{
  var data = await RestService.request(
      endpoint: API.search_tmdb_tv,
      queryParams: {
        'q': search_string
      },
      auth: true
  );

  return data;
}