import 'package:cross_media_recommendation/elements/CustomSpacer.dart';
import 'package:cross_media_recommendation/elements/ItemList.dart';
import 'package:cross_media_recommendation/elements/ListScrollButton.dart';
import 'package:cross_media_recommendation/elements/heading_element.dart';
import 'package:cross_media_recommendation/helper/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class MyList extends StatefulWidget{
  MyList({Key? key}) : super(key: key);

  @override
  PageState createState () => PageState();
}

class PageState extends State<MyList>{
  ItemScrollController scrollController = ItemScrollController();
  ItemPositionsListener scrollPosition = ItemPositionsListener.create();
  int curIndex = 0;
  int count = 0;
  int max = 13;
  @override
  void initState(){
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // print(MediaQuery.of(context).size.width * 0.7);
    // print(MediaQuery.of(context).size.width * 0.18);
    count = ((MediaQuery.of(context).size.width * 0.75) / (MediaQuery.of(context).size.width * 0.13)).toInt();
    // print("Count: " + count.toString());
    return Container(
      // height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            // decoration: testDec,
            // margin: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HeadingElement(),
                ListScrollButton(nextPageCB: nextPage, prevPageCB: prevPage,),
              ],
            ),
          ),
          CustomSpacer(height: 10,),
          ItemList(scrollController: scrollController,)
        ],
      ),
    );
  }

  void nextPage(){

    if(curIndex < (max-count)){
      scrollController.scrollTo(index: (curIndex + count), duration: Duration(milliseconds: 400), curve: Curves.easeOut);
      curIndex += count;
    }

  }

  void prevPage(){
    if(curIndex > 0){
      scrollController.scrollTo(index: (curIndex - count), duration: Duration(milliseconds: 400), curve: Curves.easeOut);
      curIndex -= count;
    }
  }
}