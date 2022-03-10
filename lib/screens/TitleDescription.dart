import 'package:cross_media_recommendation/controllers/body_main_controller.dart';
import 'package:cross_media_recommendation/controllers/title_controller.dart';
import 'package:cross_media_recommendation/elements/CustomSpacer.dart';
import 'package:cross_media_recommendation/elements/MyList.dart';
import 'package:cross_media_recommendation/elements/TitleDetails.dart';
import 'package:cross_media_recommendation/helper/constants.dart';
import 'package:cross_media_recommendation/models/basic_title_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';


class TitleDescription extends StatefulWidget{
  BasicTitleModel titleModel;

  TitleDescription({Key? key, required this.titleModel}) : super(key: key);
  @override
  PageState createState() => PageState();
}

class PageState extends StateMVC<TitleDescription>{
  TitleController? con;

  PageState() : super(TitleController()){
    con = controller as TitleController;
  }
  @override
  void initState(){
    super.initState();
    con!.fetchTitleDetails(widget.titleModel);
    con!.fetchRecommendations(widget.titleModel);
  }

  @override
  void didUpdateWidget(TitleDescription oldWidget){
    con!.fetchTitleDetails(widget.titleModel);
    con!.fetchRecommendations(widget.titleModel);
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return con!.titleLoaded ? Container(
      height: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                // minHeight: MediaQuery.of(context).size.width * bodyMainWidthRatio * 720/1280 - 80,
                // maxHeight: MediaQuery.of(context).size.width * bodyMainWidthRatio * 720/1280 - 80,

                //for laptop
                // maxHeight: MediaQuery.of(context).size.height * 0.9,

                //for ipad
                maxHeight: MediaQuery.of(context).size.width * 720/1280
              ),
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(left: 20, right: 20),
                // width: MediaQuery.of(context).size.height * 0.8 * 1280/720,
                // height: MediaQuery.of(context).size.width * bodyMainWidthRation * 720/1280,
                decoration: BoxDecoration(
                  // border: testBorder,
                  image: DecorationImage(
                    image: NetworkImage(
                      tmdb_image_url + poster_size_1280 + con!.titleModel!.backdrop_path!,
                    ),
                    colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.12), BlendMode.dstATop),
                    // fit: BoxFit.fill,
                  ),
                ),
                child: TitleDetails(titleModel: con!.titleModel!,),
              ),
            ),
            con!.loadedRecom ? Container(
              padding: edgeInsetsAll20,
              child: Column(
                children: con!.recom_data!.keys.map((element){
                  return Column(
                    children: [
                      MyList(data: con!.recom_data![element],),
                      CustomSpacer(height: 30,),
                    ],
                  );
                }).toList(),
              ),
            ) : Text("Loading")
          ],
        ),
      ),
    ) : Text("Loading");
  }
}