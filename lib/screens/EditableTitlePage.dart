import 'package:cross_media_recommendation/controllers/edit_title_controller.dart';
import 'package:cross_media_recommendation/elements/TitleDetails.dart';
import 'package:cross_media_recommendation/elements/TitleEditor.dart';
import 'package:cross_media_recommendation/helper/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../elements/CustomSpacer.dart';

class EditableTitlePage extends StatefulWidget{
  Map<String, dynamic>? customData;
  EditableTitlePage({Key? key, required this.customData}) : super(key: key);
  @override
  PageState createState() => PageState();
}

class PageState extends StateMVC<EditableTitlePage>{
  EditTitleController? con;
  PageState() : super(EditTitleController()){
    con = controller as EditTitleController;
  }

  @override
  void initState(){
    super.initState();
    con!.fetchTitleDetail(widget.customData!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Container(
        padding: edgeInsetsAll20,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                child: Text(
                    "Title View",
                    style: Theme.of(context).textTheme.headline1
                )
            ),
            CustomSpacer(height: 20),
            con!.titleLoaded ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(
                    // minHeight: MediaQuery.of(context).size.width * bodyMainWidthRatio * 720/1280 - 80,
                    // maxHeight: MediaQuery.of(context).size.width * bodyMainWidthRatio * 720/1280 - 80,

                    //for laptop
                    maxHeight: MediaQuery.of(context).size.height * 0.8,

                    //for ipad
                    // maxHeight: MediaQuery.of(context).size.width * 720/1280
                  ),
                  child: Container(
                    // alignment: Alignment.center,
                    // padding: EdgeInsets.only(left: 20, right: 20),

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
                    child: TitleDetails(titleModel: con!.titleModel!, width: MediaQuery.of(context).size.width * 0.8 - 40,)
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.20 - 40,
                  color: Colors.black.withOpacity(0.3),
                  height: MediaQuery.of(context).size.height * 0.8,
                  padding: edgeInsetsAll20,
                  child: TitleEditor(con: con!,),
                )
              ],
            )
                : Text("Loading")
          ],
        ),
      ),
    );
  }
}