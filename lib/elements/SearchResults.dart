import 'package:cross_media_recommendation/controllers/body_main_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import 'CustomSpacer.dart';
import 'MyList.dart';
import 'dart:html' as html;

class SearchResults extends StatefulWidget{
  Map<String, dynamic> search_results_data;

  SearchResults({Key? key, required this.search_results_data,}) : super(key: key);

  @override
  PageState createState() => PageState();
}

class PageState extends StateMVC<SearchResults>{

  @override
  void initState(){
    super.initState();
    // html.window.history.pushState(null, 'Search', '#/home/search');
    print("SRD");
    print(widget.search_results_data);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 100, left: 20, right: 20, bottom: 20),
      child: Column(
        children: widget.search_results_data.keys.map((element){
          return Column(
            children: [
              // element here is the key value for search_results_data. key value will
              // probably be 'movies', 'tv', etc.
              MyList(data: widget.search_results_data[element],),
              CustomSpacer(height: 30,),
            ],
          );
        }).toList()
      )
    );
  }
}