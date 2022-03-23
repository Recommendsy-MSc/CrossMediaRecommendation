import 'package:flutter/cupertino.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:cross_media_recommendation/repositories/search_repo.dart' as sr;

class SearchBarController extends ControllerMVC{
  TextEditingController searchTextController = TextEditingController();
  Map<String, dynamic>? search_results_data;


  void searchStringCallback() async{

    search_results_data = (await fetchSearchResults(searchTextController!.text))['data'];
    Navigator.of(state!.context).pushNamed('/SearchScreen', arguments: this);
    // switchPage(3);
  }

  Future<dynamic> fetchSearchResults(search_string) async{
    return await sr.searchString(search_string);
  }

}