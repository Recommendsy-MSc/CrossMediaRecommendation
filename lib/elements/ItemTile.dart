import 'package:cached_network_image/cached_network_image.dart';
import 'package:cross_media_recommendation/elements/CustomSpacer.dart';
import 'package:cross_media_recommendation/helper/constants.dart';
import 'package:cross_media_recommendation/models/basic_movie_model.dart';
import 'package:cross_media_recommendation/models/basic_title_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemTile extends StatefulWidget{
  double parentWidth;
  BasicTitleModel titleModel;
  ItemTile({Key? key, required this.parentWidth, required this.titleModel}) : super(key: key);
  @override
  PageState createState() => PageState();
}

class PageState extends State<ItemTile>{

  @override
  void initState(){
    super.initState();
    // print("GOT TILE DATA:");
    // print(widget.movieModel.toMap().toString());
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: tmdb_image_url + poster_size_342 + widget.titleModel.poster_path!,
              width: widget.parentWidth,
              fit: BoxFit.fill,
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // CustomSpacer(height: 8),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 16,
                      ),
                      Text(
                        " 4 ",
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ],
                  ),
                  SizedBox(height: 4,),
                  Flexible(
                    child: Text(
                      widget.titleModel.title!,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        Align(
          alignment: Alignment.topRight,
          child: Container(
            margin: edgeInsetsAll12,
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: white,
              borderRadius: borderRadius8
            ),
            child: Icon(
              Icons.add,
              color: accentColor,
              size: 20,
            )
          ),
        )
      ],
    );
  }
}