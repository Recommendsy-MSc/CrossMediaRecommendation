import 'package:flutter/cupertino.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:cross_media_recommendation/repositories/search_repo.dart' as sr;
import 'package:cross_media_recommendation/repositories/global_var_repo.dart' as gr;

class SearchBarController extends ControllerMVC{
  TextEditingController searchTextController = TextEditingController();
  Map<String, dynamic>? search_results_data;
  bool searchLoaded = false;


  void searchStringCallback() async{
    Navigator.of(state!.context).pushNamed('/SearchScreen', arguments: this);
    // search_results_data = (await fetchSearchResults(searchTextController.text))['data'];

    // switchPage(3);
  }

  Future<dynamic> fetchSearchResults() async{
    // gr.showLoader(state!.context);
    search_results_data = (await sr.searchString(searchTextController.text))['data'];
    return search_results_data;
    // gr.hideLoader(state!.context);
  }

}