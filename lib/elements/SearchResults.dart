
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import 'CustomSpacer.dart';
import 'MyList.dart';

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
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(top: 100, left: 20, right: 20, bottom: 20),
            height: double.infinity,
            child: ListView.builder(
              itemCount: widget.search_results_data.keys.length,
              itemBuilder: (context, index){
                return Column(
                  children: [
                    // element here is the key value for search_results_data. key value will
                    // probably be 'movies', 'tv', etc.
                    MyList(data: widget.search_results_data[widget.search_results_data.keys.elementAt(index)],),
                    CustomSpacer(height: 30,),
                  ],
                );
              },
            ),

          ),

        ],
      )
    );
  }
}