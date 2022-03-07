import 'package:cross_media_recommendation/elements/MyList.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:cross_media_recommendation/repositories/movie_repo.dart' as mr;
import 'package:cross_media_recommendation/repositories/genre_repo.dart' as gr;

class HomeBodyController extends ControllerMVC{
  bool defaultListLoaded = false;
  List<Map<String, dynamic>> defaultListData = [];


  // defaultList(){
  //   for(var d in defaultListData){
  //     myLists.add(MyList(data: d,));
  //   }
  //   setState(() {
  //     defaultListLoaded = true;
  //   })
  // }

  loadHomeData() async{
    // print(gr.movie_genres.toString());
    await fetchTopMovieForGenre(genre: gr.movie_genres.keys.first);
    await fetchTopMovieForGenre(genre: gr.movie_genres.keys.elementAt(1));
    await fetchTopMovieForGenre(genre: gr.movie_genres.keys.elementAt(2));
    await fetchTopMovieForGenre(genre: gr.movie_genres.keys.elementAt(3));
    await fetchTopMovieForGenre(genre: gr.movie_genres.keys.elementAt(4));

    setState(() {
      defaultListLoaded = true;
      // print("len: " + defaultListData.length.toString());
    });
  }

  fetchTopMovieForGenre({limit = 25, genre}) async{
    var data = await mr.getTopMovieForGenre(limit: limit, genre: genre);
    defaultListData.add(data);
  }
}