import 'package:cross_media_recommendation/elements/HomeBody.dart';
import 'package:cross_media_recommendation/elements/SearchResults.dart';
import 'package:cross_media_recommendation/screens/TitleDescription.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:cross_media_recommendation/repositories/search_repo.dart' as sr;


class BodyMainController extends ControllerMVC{
  Widget? bodyWidget;
  Map<String, dynamic>? search_results;

  void switchPage(int index, {data}){
    print("Switching");
    switch(index){
      case 0:
        bodyWidget = HomeBody();
        break;
      case 1:
        bodyWidget = SearchResults(search_results_data: search_results!['data'],);
        break;
      case 2:
        bodyWidget = TitleDescription(title_id: data as String,);
        break;
    }
    setState(() { });
  }


  void searchStringSubmitCallback(search_string) async{
    search_results = await fetchSearchResults(search_string);
    switchPage(1);
  }

  Future<dynamic> fetchSearchResults(search_string) async{
    return await sr.searchString(search_string);
  }
}