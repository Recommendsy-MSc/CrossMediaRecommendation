import 'package:flutter/cupertino.dart';
import 'package:cross_media_recommendation/helper/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchBar extends StatefulWidget{
  SearchBar({Key? key}): super(key: key);

  @override
  PageState createState () => PageState();
}

class PageState extends State<SearchBar>{
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.2,
      // padding: edgeInsetsAll12,
      // decoration: BoxDecoration(
      //   borderRadius: borderRadius12,
      //   border: Border.all(color: accentTextColor, width: 0.2)
      // ),
        child: TextFormField(

          decoration: InputDecoration(
            hintText: "Search",
            hintStyle: Theme.of(context).textTheme.headline6,
            prefixIcon: Icon(
              Icons.search,
              color: accentColor.withOpacity(0.5),
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: borderRadius12,
                borderSide: BorderSide(color: accentColor.withOpacity(0.4))),
            focusedBorder: OutlineInputBorder(
                borderRadius: borderRadius12,
                borderSide: BorderSide(color: accentColor)
            ),

          ),
        )
    );
  }
}