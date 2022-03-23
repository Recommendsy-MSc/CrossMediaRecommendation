import 'package:cross_media_recommendation/elements/MyList.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:cross_media_recommendation/repositories/movie_repo.dart' as mr;
import 'package:cross_media_recommendation/repositories/genre_repo.dart' as gr;
import 'package:cross_media_recommendation/repositories/tv_repo.dart' as tr;
import 'package:cross_media_recommendation/repositories/user_repo.dart' as ur;

class MovieScreenController extends ControllerMVC{
  bool tabDataLoaded = false;
  List<Map<String, dynamic>> defaultListData = [];
  bool hasAny = false;

  loadData() async{
    ur.loggedIn ? fetchTabDataForUser() : fetchTabDataForGuest();
  }

  fetchTabDataForGuest() async{
    tabDataLoaded = false;
    defaultListData = [];
    for(var genre_id in gr.movie_genres.keys.toList().sublist(0, 5)){
      await fetchTopMovieForGenre(genre: genre_id);

    }

  }

  fetchTopMovieForGenre({limit = 12, genre}) async{
    var data = await mr.getTopMovieForGenre(limit: limit, genre: genre);
    defaultListData.add(data);
    if(data['data']['count'] > 0){
      hasAny = true;
      setState(() {
        tabDataLoaded = true;
      });
    }

  }

  fetchTabDataForUser() async{
    defaultListData = [];
    tabDataLoaded = false;
    for(var genre_id in gr.movie_genres.keys.toList().sublist(0, 5)){
      await fetchRecommendedMovieForGenre(genre: genre_id);
    }
    if(!hasAny){
      defaultListData = [];
      fetchTabDataForGuest();
    }
  }

  fetchRecommendedMovieForGenre({limit = 12, genre}) async{
    var data = await mr.getMovieRecomForUser(limit: limit, genre: genre);
    defaultListData.add(data);

    if(data['data']['count'] > 0){
      hasAny = true;
      setState(() {
        tabDataLoaded = true;
      });
    }
    print(data['count']);
    print("Added " + genre);
  }



}