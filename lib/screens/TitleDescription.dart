import 'package:cross_media_recommendation/controllers/title_controller.dart';
import 'package:cross_media_recommendation/elements/TitleDetails.dart';
import 'package:cross_media_recommendation/helper/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class TitleDescription extends StatefulWidget{
  String? title_id;

  TitleDescription({Key? key, required this.title_id}) : super(key: key);
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
  }
  @override
  Widget build(BuildContext context) {
    return con!.titleLoaded ? Column(
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
    ) : Text("Loading");
  }
}