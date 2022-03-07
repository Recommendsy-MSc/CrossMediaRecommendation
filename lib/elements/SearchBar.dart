import 'package:flutter/cupertino.dart';
import 'package:cross_media_recommendation/helper/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchBar extends StatefulWidget{
  Function onSubmitCallback;
  SearchBar({Key? key, required this.onSubmitCallback}): super(key: key);

  @override
  PageState createState () => PageState();
}

class PageState extends State<SearchBar>{
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.2,

        child: TextFormField(
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
            widget.onSubmitCallback(value);
          },
        )
    );
  }
}