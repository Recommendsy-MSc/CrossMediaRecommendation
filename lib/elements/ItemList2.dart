import 'package:cross_media_recommendation/helper/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ItemList2 extends StatefulWidget{

  @override
  PageState createState() => PageState();
}

class PageState extends State<ItemList2>{
  ItemScrollController scrollController = ItemScrollController();
  int curIndex = 0;
  int countEach = 4;
  int max = 16;
  int count = 16;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width * 0.25,
      child: Stack(
        children: [

          ScrollablePositionedList.builder(
            itemScrollController: scrollController,
            // padding: EdgeInsets.symmetric(horizontal: 8),
            scrollDirection: Axis.horizontal,
            itemCount: count,
            itemBuilder: (context, index){
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                width:( MediaQuery.of(context).size.width * 0.62 - 80 - 24 - 64 )/4,
                decoration: testDec,
                child: Text(index.toString(), style:TextStyle(color: white)),
              );
            },
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
              width: 24,
              child: InkWell(
                onTap: (){
                  prevPage();
                },
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: primaryTextColor
                  ),
                  width: 24,
                  child: Icon(
                    Icons.chevron_left,
                    // size: 24,
                    color: primaryColor,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              width: 24,
              child: InkWell(
                onTap: (){
                  nextPage();
                },
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: primaryTextColor
                  ),
                  width: 24,
                  child: Icon(
                    Icons.chevron_right,
                    // size: 24,
                    color: primaryColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void nextPage(){
    if(curIndex < (count-countEach)){
      scrollController.scrollTo(index: (curIndex + countEach), duration: Duration(milliseconds: 400), curve: Curves.easeOut);
      curIndex += countEach;
    }

  }

  void prevPage(){
    if(curIndex > 0){
      scrollController.scrollTo(index: (curIndex - countEach), duration: Duration(milliseconds: 400), curve: Curves.easeOut);
      curIndex -= countEach;
    }

  }
}