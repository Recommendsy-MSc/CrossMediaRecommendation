import 'package:cross_media_recommendation/controllers/search_bar_controller.dart';
import 'package:cross_media_recommendation/elements/CustomSpacer.dart';
import 'package:cross_media_recommendation/elements/Loader.dart';
import 'package:cross_media_recommendation/elements/TopNavSearchPage.dart';
import 'package:cross_media_recommendation/helper/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../elements/MyList.dart';

class SearchScreen extends StatefulWidget{
  SearchBarController searchBarController;
  SearchScreen({required this.searchBarController});

  @override
  PageState createState() => PageState();
}

class PageState extends StateMVC<SearchScreen>{



  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      widget.searchBarController.fetchSearchResults();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(top: 100, left: 20, right: 20, bottom: 20),
              height: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      "Search: " + widget.searchBarController.searchTextController.text,
                      style: TextStyle(
                        fontSize: 16,
                        color: primaryTextColor.withOpacity(0.7)
                      ),
                    )
                  ),
                  CustomSpacer(height: 20,),
                  Expanded(
                    child: FutureBuilder(
                      future: widget.searchBarController.fetchSearchResults(),
                      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot){
                        if(snapshot.connectionState == ConnectionState.waiting){
                          return Loading(color: primaryTextColor,);
                        }else if(snapshot.hasData){
                          print("Snapshot");
                          print(snapshot);
                          return ListView.builder(
                            itemCount: snapshot.data.keys.length,
                            itemBuilder: (context, index){
                              return Column(
                                children: [
                                  // element here is the key value for search_results_data. key value will
                                  // probably be 'movies', 'tv', etc.
                                  MyList(data: snapshot.data[snapshot.data.keys.elementAt(index)],),
                                  CustomSpacer(height: 30,),
                                ],
                              );
                            },
                          );
                        }else{
                          return Container(
                            child: Text("Eror")
                          );
                        }
                      },
                    )
                  ),
                ],
              ),

            ),
            Container(
              // decoration: testDec,
                padding: EdgeInsets.symmetric(horizontal: 20),
                // decoration: testDec,
                child: TopNavSearchPage()
            ),
          ],
        )
    );
  }
}