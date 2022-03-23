import 'package:cached_network_image/cached_network_image.dart';
import 'package:cross_media_recommendation/controllers/title_detail_controller.dart';
import 'package:cross_media_recommendation/elements/CustomSpacer.dart';
import 'package:cross_media_recommendation/elements/GenreDisplay.dart';
import 'package:cross_media_recommendation/elements/ReportDialog.dart';
import 'package:cross_media_recommendation/elements/ReportDialogDef.dart';
import 'package:cross_media_recommendation/helper/FToastHelper.dart';
import 'package:cross_media_recommendation/helper/constants.dart';
import 'package:cross_media_recommendation/models/title_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:cross_media_recommendation/repositories/user_repo.dart' as ur;

class TitleDetails extends StatefulWidget{
  TitleModel titleModel;
  double? width;

  TitleDetails({Key? key, required this.titleModel, this.width}) : super(key: key);
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
    // print"Titlw Type: " + widget.titleModel.title_type.toString());
    con!.titleModel = widget.titleModel;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: widget.width,
            child: Row(
              children: [
                CachedNetworkImage(
                  imageUrl: tmdb_image_url + poster_size_342 + con!.titleModel!.poster_path!,
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
                                      con!.titleModel!.title!,
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
                                          con!.titleModel!.release_date!,
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
                            con!.titleModel!.tagline!,
                            style: Theme.of(context).textTheme.headline4,
                          ),
                          Text(
                            con!.titleModel!.overview!,
                            style: Theme.of(context).textTheme.headline4,
                          ),
                          Text(
                            "Cast: " + con!.getStringFromList(con!.titleModel!.cast_members!),
                            style: Theme.of(context).textTheme.headline4,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Flexible(
                            child: Wrap(
                              children: con!.titleModel!.genres!.map((e){
                                return Container(
                                  margin: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                                  child: GenreDisplay(genre: e.name!)
                                );
                              }).toList()
                            ),
                          ),

                        ],
                      ),
                    )
                ),
              ],
            ),
          ),
          ur.loggedIn ? CustomSpacer(height: 10,)  : CustomSpacer(height: 0,),
          ur.loggedIn && !ur.isAdmin ? Container(
            width: 250,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: con!.like,
                      child: Icon(
                        con!.titleModel!.user_rating == 5 ? Icons.thumb_up_alt_rounded : Icons.thumb_up_off_alt_outlined,
                        color: con!.titleModel!.user_rating == 5 ? Colors.green.withOpacity(0.7) : primaryTextColor.withOpacity(0.3),
                        size: 34,
                      ),
                    ),
                    CustomSpacer(width: 10,),
                    InkWell(
                      onTap: con!.dislike,
                      child: Icon(
                        con!.titleModel!.user_rating == 1 ? Icons.thumb_down_alt_rounded : Icons.thumb_down_off_alt_outlined,
                        color: con!.titleModel!.user_rating == 1 ? accentColor.withOpacity(0.9) : primaryTextColor.withOpacity(0.3),
                        size: 34,
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: (){
                    // print"report dropdown");
                    // showDialog(
                    //     context: context,
                    //     builder: (context){
                    //       return ReportDialog(titleModel: widget.titleModel);
                    //     },
                    // );
                    ReportDialogDef(data: widget.titleModel, name: "Report Title").show(context).then((value){
                        if(value == true){
                          CustomToast(context: context, msg: "Reported!", ).showToast();
                        }else{
                          CustomToast(context: context, msg: "An Error Occured!", ).showToast();
                        }
                    });
                  },
                  child: Icon(
                    Icons.remove_circle_outline,
                    color: primaryTextColor.withOpacity(0.7),
                    size: 38,
                  ),
                )
              ],
            ),
          ) : Container(height: 0,),
        ],
      )
    );
  }
}