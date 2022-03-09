import 'package:cached_network_image/cached_network_image.dart';
import 'package:cross_media_recommendation/controllers/title_detail_controller.dart';
import 'package:cross_media_recommendation/elements/CustomSpacer.dart';
import 'package:cross_media_recommendation/elements/GenreDisplay.dart';
import 'package:cross_media_recommendation/helper/constants.dart';
import 'package:cross_media_recommendation/models/title_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class TitleDetails extends StatefulWidget{
  TitleModel titleModel;

  TitleDetails({Key? key, required this.titleModel}) : super(key: key);
  @override
  PageState createState() => PageState();
}

class PageState extends StateMVC<TitleDetails>{
  TitleDetailController? con;
  PageState() : super(TitleDetailController()){
    con = controller as TitleDetailController;
  }

  @override
  void initState(){
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          // Container(
          //   child: Image.network(
          //     tmdb_image_url + poster_size_342 + widget.titleModel.poster_path!,
          //     width: 250,
          //     height: 513*250/342,
          //   ),
          // ),
          CachedNetworkImage(
            imageUrl: tmdb_image_url + poster_size_342 + widget.titleModel.poster_path!,
            width: 250,
            height: 513*250/342,
          ),
          Expanded(
              child: Container(
                height: 513*250/342,
                // decoration: testDec,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.titleModel.title!,
                                style: Theme.of(context).textTheme.headline2,
                              ),
                              CustomSpacer(height: 8,),
                              Row(
                                children: [
                                  Icon(
                                    Icons.date_range,
                                    color: primaryTextColor,
                                  ),
                                  CustomSpacer(width: 8,),

                                  Text(
                                    widget.titleModel.release_date!,
                                    style: Theme.of(context).textTheme.headline5,

                                  ),
                                  CustomSpacer(width: 12,),
                                  Icon(
                                    Icons.access_time,
                                    color: primaryTextColor,
                                  ),
                                  CustomSpacer(width: 4,),
                                  Text(
                                    "2h 02min",
                                    style: Theme.of(context).textTheme.headline5,

                                  )
                                ],
                              )

                            ],
                          ),
                        ],
                      ),
                    ),
                    Text(
                      widget.titleModel.tagline!,
                      style: Theme.of(context).textTheme.headline4,

                    ),
                    Text(
                      widget.titleModel.overview!,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    Text(
                      "Cast: " + con!.getStringFromList(widget.titleModel.cast_members!),
                      style: Theme.of(context).textTheme.headline4,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Flexible(
                      child: Wrap(
                        children: widget.titleModel.genres!.map((e){
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                            child: GenreDisplay(genre: e.name!)
                          );
                        }).toList()
                      ),
                    )
                  ],
                ),
              )
          ),
        ],
      )
    );
  }
}