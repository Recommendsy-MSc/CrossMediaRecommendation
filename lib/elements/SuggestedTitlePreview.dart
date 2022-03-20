import 'package:cached_network_image/cached_network_image.dart';
import 'package:cross_media_recommendation/models/suggested_title_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:cross_media_recommendation/helper/constants.dart';
import 'package:flutter/material.dart';

import 'CustomSpacer.dart';
import 'GenreDisplay.dart';

class SuggestedTitlePreview extends StatefulWidget{
  SuggestedTitleModel? object;
  SuggestedTitlePreview({required this.object});

  @override
  PageState createState() => PageState();
}

class PageState extends State<SuggestedTitlePreview>{
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: tmdb_image_url + poster_size_185 + widget.object!.poster_path!,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              // height: MediaQuery.of(context).size.height * 0.6,
              width: MediaQuery.of(context).size.width * 0.4 - 70 - 185 - 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.object!.title!,
                          style: TextStyle(
                            color: primaryTextColor.withOpacity(0.7),
                            fontSize: 16
                          ),
                        ),
                        CustomSpacer(height: 12,),
                        Text(
                            widget.object!.release_date!,
                          style: TextStyle(
                              color: primaryTextColor.withOpacity(0.5),
                              fontSize: 14
                          ),
                        ),
                        CustomSpacer(height: 20,),
                        Flexible(
                          child: Wrap(
                              children: widget!.object!.genres!.map((e){
                                return Container(
                                    margin: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                                    child: GenreDisplay(genre: e.name!)
                                );
                              }).toList()
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    widget.object!.overview!,
                    style: TextStyle(
                        color: primaryTextColor.withOpacity(0.5),
                        fontSize: 14,
                    ),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}