import 'package:cross_media_recommendation/controllers/edit_title_controller.dart';
import 'package:cross_media_recommendation/elements/ButtonComponent.dart';
import 'package:cross_media_recommendation/elements/CustomSpacer.dart';
import 'package:cross_media_recommendation/elements/EditStringDialog.dart';
import 'package:cross_media_recommendation/elements/EditStringDialogDef.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../helper/constants.dart';

class TitleEditor extends StatefulWidget{
  EditTitleController? con;
  TitleEditor({required this.con});
  @override
  PageState createState() => PageState();
}

class PageState extends State<TitleEditor>{
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Text(
                "Editor",
                style: TextStyle(
                  fontSize: 20,
                  color: accentColor
                ),
              ),
            ),
            CustomSpacer(),
            Text(
              "Click on attribute to edit",
              style: TextStyle(
                fontSize: 12,
                color: primaryTextColor.withOpacity(0.6)
              ),
            ),
            CustomSpacer(),
            InkWell(
              onTap: () async{
                EditStringDialogDef(name: 'Title', value: widget.con!.titleModel!.title!).show(context).then((value){
                  if(value['submit']){
                    // print"submitted");
                    // printvalue['data']);
                    widget.con!.titleModel!.title = value['data'];
                    widget.con!.refresh();
                  }
                  // Navigator.of(context).pop();
                });
              },
              child: Text(
                "Title",
                style: TextStyle(
                    fontSize: 14,
                    color: primaryTextColor.withOpacity(0.9)
                ),
              ),
            ),
            CustomSpacer(height: 10,),
            InkWell(
              onTap: (){
                EditStringDialogDef(name: 'Overview', value: widget.con!.titleModel!.overview!).show(context).then((value){
                  if(value['submit']){
                    widget.con!.titleModel!.overview = value['data'];
                    widget.con!.refresh();
                  }
                  // Navigator.of(context).pop();
                });
              },
              child: Text(
                  "Overview",
                style: TextStyle(
                    fontSize: 14,
                    color: primaryTextColor.withOpacity(0.9)
                ),
              ),
            ),
            // CustomSpacer(height: 10,),
            // Text(
            //     "Genres",
            //   style: TextStyle(
            //       fontSize: 14,
            //       color: primaryTextColor.withOpacity(0.9)
            //   ),
            // ),
            // CustomSpacer(height: 10,),
            // Text(
            //     "Cast",
            //   style: TextStyle(
            //       fontSize: 14,
            //       color: primaryTextColor.withOpacity(0.9)
            //   ),
            // ),
            CustomSpacer(height: 10,),
            InkWell(
              onTap: (){
                EditStringDialogDef(name: 'Tagline', value: widget.con!.titleModel!.tagline!).show(context).then((value){
                  if(value['submit']){
                    widget.con!.titleModel!.tagline = value['data'];
                    widget.con!.refresh();
                  }
                  // Navigator.of(context).pop();
                });
              },
              child: Text(
                  "Tagline",
                style: TextStyle(
                    fontSize: 14,
                    color: primaryTextColor.withOpacity(0.9)
                ),
              ),
            ),
            CustomSpacer(height: 10,),
            InkWell(
              onTap: (){
                EditStringDialogDef(name: 'Poster Path', value: widget.con!.titleModel!.poster_path!).show(context).then((value){
                  if(value['submit']){
                    widget.con!.titleModel!.poster_path = value['data'];
                    widget.con!.refresh();
                  }
                  // Navigator.of(context).pop();
                });
              },
              child: Text(
                  "Poster Path",
                style: TextStyle(
                    fontSize: 14,
                    color: primaryTextColor.withOpacity(0.9)
                ),
              ),
            ),
            CustomSpacer(height: 10,),
            InkWell(
              onTap: (){
                EditStringDialogDef(name: 'Backdrop Path', value: widget.con!.titleModel!.backdrop_path!).show(context).then((value){
                  if(value['submit']){
                    widget.con!.titleModel!.backdrop_path = value['data'];
                    widget.con!.refresh();
                  }
                  // Navigator.of(context).pop();
                });
              },
              child: Text(
                  "Backdrop Path",
                style: TextStyle(
                    fontSize: 14,
                    color: primaryTextColor.withOpacity(0.9)
                ),
              ),
            ),

          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ButtonComponent(title: "Save", onClick: (){
              widget.con!.patchNewData();
            }),
            ButtonComponent(title: "Resolved", onClick: (){
              widget.con!.markReportAsResolved();
            })
          ],
        )
      ],
    );
  }
}