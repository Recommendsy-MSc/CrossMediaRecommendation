import 'package:cross_media_recommendation/elements/MyList.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:cross_media_recommendation/repositories/movie_repo.dart' as mr;
import 'package:cross_media_recommendation/repositories/genre_repo.dart' as gr;
import 'package:cross_media_recommendation/repositories/tv_repo.dart' as tr;
import 'package:cross_media_recommendation/repositories/user_repo.dart' as ur;

class TvScreenController extends ControllerMVC{
  bool tabDataLoaded = false;
  List<Map<String, dynamic>> defaultListData = [];
  bool hasAny = false;

  loadData() async{
    ur.loggedIn ? fetchTabDataForUser() : fetchTabDataForGuest();
  }

  fetchTabDataForGuest() async{
    for(var genre_id in gr.tv_genres.keys.toList().sublist(0, 5)){
      await fetchTopTvForGenre(genre: genre_id);
      setState(() {
        tabDataLoaded = true;
      });
    }
    setState(() {
      tabDataLoaded = true;
    });
  }

  fetchTopTvForGenre({limit = 12, genre}) async{
    var data = await tr.getTopTvForGenre(limit: limit, genre: genre);
    defaultListData.add(data);
    if(data['data']['count'] > 0){
      hasAny = true;
      setState(() {
        tabDataLoaded = true;
      });
    }

  }

  fetchTabDataForUser() async{
    tabDataLoaded = false;
    for(var genre_id in gr.tv_genres.keys.toList().sublist(0, 5)){
      await fetchRecommendedTvForGenre(genre: genre_id);
    }

  }

  fetchRecommendedTvForGenre({limit = 12, genre}) async{
    var data = await tr.getTvRecomForUser(limit: limit, genre: genre);
    defaultListData.add(data);
    if(data['data']['count'] > 0){
      hasAny = true;
      setState(() {
        tabDataLoaded = true;
      });
    }

  }




}