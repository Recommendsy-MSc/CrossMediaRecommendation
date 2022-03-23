import 'package:cross_media_recommendation/controllers/reports_page_controller.dart';
import 'package:cross_media_recommendation/elements/ButtonComponent.dart';
import 'package:cross_media_recommendation/elements/CustomSpacer.dart';
import 'package:cross_media_recommendation/elements/MissingTitleReportTile.dart';
import 'package:cross_media_recommendation/elements/SuggestedTitlePreview.dart';
import 'package:cross_media_recommendation/models/reports_models/missing_title_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../elements/SuggestedTitleTile.dart';
import '../helper/constants.dart';

class AdminSuggestedTitles extends StatefulWidget{
  MissingTitleModel object;

  AdminSuggestedTitles({required this.object});
  @override
  PageState createState() => PageState();
}

class PageState extends StateMVC<AdminSuggestedTitles>{
  ReportsPageController? con;
  PageState() : super(ReportsPageController()){
    con = controller as ReportsPageController;
  }

  @override
  void initState(){
    super.initState();
    con!.fetchSuggestionsForMissing(search_string: widget.object.title, type: widget.object.title_type);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Container(
        padding: edgeInsetsAll20,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Text(
                  "Missing Title",
                  style: Theme.of(context).textTheme.headline1
              )
            ),
            CustomSpacer(height: 30,),
            Container(
                width: MediaQuery.of(context).size.width * 0.6,
              child: MissingTitleReportTile(object: widget.object)
            ),
            CustomSpacer(height: 30,),
            Expanded(
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            child: Text(
                                "TMDB Lookup",
                                style: Theme.of(context).textTheme.headline2
                            )
                        ),
                        CustomSpacer(height: 30,),
                        Expanded(
                          child: con!.suggestedTitlesList.isNotEmpty ? ListView.builder(
                            itemCount: con!.suggestedTitlesList.length,
                            itemBuilder: (context, index){
                              return SuggestedTitleTile(object: con!.suggestedTitlesList[index], showPreviewCallback: con!.switchSuggestedTitlePreview,);
                            },
                          ): Container(),
                        )
                      ],
                    ),
                  ),
                  CustomSpacer(width: 20,),
                  Container(
                    width: 1,
                    decoration: BoxDecoration(
                      border: Border(left: BorderSide(color: primaryTextColor.withOpacity(0.7)))
                    ),
                  ),
                  CustomSpacer(width: 20,),

                  Container(
                    width: MediaQuery.of(context).size.width * 0.4 - 90,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                child: Text(
                                    "Title Preview",
                                    style: Theme.of(context).textTheme.headline2
                                )
                            ),
                            con!.showSuggestedPreview ? Tooltip(
                              message: "Add Title to Databse",
                              child: ButtonComponent(title: "Add", onClick: (){
                                con!.addTitleForMissingReport(report_id: widget.object.id!,);
                              }),
                            ) : Container()
                          ],
                        ),
                        CustomSpacer(height: 30,),
                        con!.showSuggestedPreview ? SuggestedTitlePreview(object: con!.previewModel) : Container()
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}