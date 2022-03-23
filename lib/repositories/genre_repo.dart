import 'package:cross_media_recommendation/network/APIs.dart';
import 'package:cross_media_recommendation/network/rest_service.dart';

Map<String, String> tv_genres = {};
Map<String, String> movie_genres = {};
bool genreLoaded = false;


Future<void> fetchMovieTvGenres() async{
  var movie_genre_data = await RestService.request(endpoint: API.genres);
  for(var data in movie_genre_data['data']){
    movie_genres[data['id']] = data['name'];
  }
  // // printmovie_genre_data);

  var tv_genre_data = await RestService.request(endpoint: API.tv_genres);
  for(var data in tv_genre_data['data']){
    tv_genres[data['id']] = data['name'];
  }
  // // printtv_genre_data);
  // print"set genres");
  for(var i in movie_genres.keys){
    // printi);
  }
  genreLoaded = true;
}