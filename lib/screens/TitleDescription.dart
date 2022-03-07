import 'package:cross_media_recommendation/elements/MyList.dart';
import 'package:cross_media_recommendation/elements/TitleDetails.dart';
import 'package:cross_media_recommendation/helper/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TitleDescription extends StatefulWidget{
  @override
  PageState createState() => PageState();
}

class PageState extends State<TitleDescription>{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.width * 0.82 * 720/1280,
            maxHeight: MediaQuery.of(context).size.width * 0.82 * 720/1280,
          ),
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(left: 20, right: 20),
            width: MediaQuery.of(context).size.width * 0.82,
            // height: MediaQuery.of(context).size.width * 0.82 * 720/1280,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    'https://image.tmdb.org/t/p/w1280/cyecB7godJ6kNHGONFjUyVN9OX5.jpg',
                  ),
                  colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.12), BlendMode.dstATop),
                  // fit: BoxFit.fill,
                ),
            ),
            child: TitleDetails(),
          ),
        ),
        Container(
          padding: edgeInsetsAll20,
          child: Column(
            children: [
              // MyList()
            ],
          ),
        )
      ],
    );
  }
}