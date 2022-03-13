import 'package:cross_media_recommendation/controllers/body_main_controller.dart';
import 'package:cross_media_recommendation/elements/ItemTile.dart';
import 'package:cross_media_recommendation/helper/constants.dart';
import 'package:cross_media_recommendation/models/basic_title_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:cross_media_recommendation/repositories/user_repo.dart' as ur;

class ItemList extends StatefulWidget{
  List<dynamic> listData;
  ItemScrollController scrollController;
  ItemList({Key? key, required this.scrollController, required this.listData,}) : super(key: key);
  @override
  PageState createState () => PageState();
}

class PageState extends State<ItemList>{
  // int count = 13;
  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: testDec,
      height: (MediaQuery.of(context).size.width * bodyMainWidthRatio - listPageCount*16-24)/listPageCount * 513/342 + (ur.loggedIn ? 50 : 0),
      child: ScrollablePositionedList.builder(
        itemScrollController: widget.scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: widget.listData.length,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index){
          BasicTitleModel titleModel = BasicTitleModel.fromJson(widget.listData[index]);
          return ClipRRect(
            borderRadius: borderRadius12,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: borderRadius12
              ),
              width: (MediaQuery.of(context).size.width * bodyMainWidthRatio - listPageCount*16 - 24) / listPageCount,
              margin: index == 0 ? EdgeInsets.only(right: 8) : index == widget.listData.length-1 ? EdgeInsets.only(left: 8,) : EdgeInsets.only(right: 8, left: 8),
              child: ItemTile(titleModel: titleModel, parentWidth: (MediaQuery.of(context).size.width * bodyMainWidthRatio - listPageCount*16-24) / listPageCount,)
            ),
          );
        },
      ),
    );
  }
}

