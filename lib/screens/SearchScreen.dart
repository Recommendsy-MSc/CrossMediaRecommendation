import 'package:cross_media_recommendation/controllers/search_bar_controller.dart';
import 'package:cross_media_recommendation/controllers/search_screen_controller.dart';
import 'package:cross_media_recommendation/elements/CustomSpacer.dart';
import 'package:cross_media_recommendation/elements/Loader.dart';
import 'package:cross_media_recommendation/elements/TopNavSearchPage.dart';
import 'package:cross_media_recommendation/helper/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../elements/MyList.dart';

class SearchScreen extends StatefulWidget{
  SearchBarController? searchBarController;
  Map<String, dynamic>? qp;
  SearchScreen({this.searchBarController, this.qp});

  @override
  PageState createState() => PageState();
}

class PageState extends StateMVC<SearchScreen>{
  SearchScreenController? con;
  PageState() : super(SearchScreenController()){
    con = controller as SearchScreenController;
  }
  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      con!.load(qp: widget.qp, barController: widget.searchBarController);
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
                  con!.loadedBasic ? Container(
                    child: Text(
                      "Search: " + con!.searchString!,
                      style: TextStyle(
                        fontSize: 16,
                        color: primaryTextColor.withOpacity(0.7)
                      ),
                    )
                  ) : Container(),
                  CustomSpacer(height: 20,),
                  Expanded(
                    child: con!.loadedBasic ? FutureBuilder(
                      future: con!.search(),
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
                    ) : Loading(color: primaryTextColor,)
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