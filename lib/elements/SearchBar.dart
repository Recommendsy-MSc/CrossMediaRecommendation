import 'package:cross_media_recommendation/controllers/search_bar_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:cross_media_recommendation/helper/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class SearchBar extends StatefulWidget{
  SearchBar({Key? key,}): super(key: key);

  @override
  PageState createState () => PageState();
}

class PageState extends StateMVC<SearchBar>{
  SearchBarController? con;

  PageState() : super(SearchBarController()){
    con = controller as SearchBarController;
  }

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.2,

        child: TextFormField(
          controller: con!.searchTextController,
          style: TextStyle(color: primaryTextColor.withOpacity(0.8), fontSize: 14),
          decoration: InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.all(0),
            hintText: "Search",
            hintStyle: TextStyle(color: primaryTextColor.withOpacity(0.4), fontSize: 14),
            prefixIcon: Icon(
              Icons.search,
              color: primaryTextColor.withOpacity(0.5),
              size: 18
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: borderRadius20,
                borderSide: BorderSide(color: primaryTextColor.withOpacity(0.4))),
            focusedBorder: OutlineInputBorder(
                borderRadius: borderRadius20,
                borderSide: BorderSide(color: primaryTextColor.withOpacity(0.6))
            ),

          ),
          onFieldSubmitted: (value){
            con!.searchStringCallback();
          },
        )
    );
  }
}