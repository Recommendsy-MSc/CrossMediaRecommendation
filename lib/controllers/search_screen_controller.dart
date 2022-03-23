import 'package:cross_media_recommendation/controllers/search_bar_controller.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class SearchScreenController extends ControllerMVC{
  SearchBarController? searchBarController;
  String? searchString;
  bool loadedBasic = false;

  void load({SearchBarController? barController, Map<String, dynamic>? qp}){
    loadedBasic = false;
    if(barController != null ){
      searchBarController = barController;
      searchString = searchBarController!.searchTextController.text;
      searchBarController!.fetchSearchResults();
      setState(() {
        loadedBasic = true;
      });
    }else{
      if(qp!['q'] != null){
        searchString = qp['q'];
        searchBarController = SearchBarController();
        searchBarController!.searchTextController.text = searchString!;
        setState(() {
          loadedBasic = true;
        });
      }else{
        Navigator.of(state!.context).pushNamedAndRemoveUntil('/HomePage', (route) => false);

      }
    }

  }



  Future<dynamic> search() async {
    return await searchBarController!.fetchSearchResults();
  }
}