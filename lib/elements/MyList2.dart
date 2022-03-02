import 'package:cross_media_recommendation/elements/CustomSpacer.dart';
import 'package:cross_media_recommendation/elements/ItemList.dart';
import 'package:cross_media_recommendation/elements/ItemList2.dart';
import 'package:cross_media_recommendation/elements/ListScrollButton.dart';
import 'package:cross_media_recommendation/elements/heading_element.dart';
import 'package:cross_media_recommendation/helper/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class MyList2 extends StatefulWidget{
  MyList2({Key? key}) : super(key: key);

  @override
  PageState createState () => PageState();
}

class PageState extends State<MyList2>{

  @override
  void initState(){
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: HeadingElement(),
            padding: EdgeInsets.symmetric(horizontal: 16),
          ),
          CustomSpacer(height: 10,),
          ItemList2(),
        ],
      ),
    );
  }

  // void nextPage(){
  //   if(curIndex < (max-count)){
  //     scrollController.scrollTo(index: (curIndex + count), duration: Duration(milliseconds: 400), curve: Curves.easeOut);
  //     curIndex += count;
  //   }
  //
  // }
  //
  // void prevPage(){
  //   if(curIndex > 0){
  //     scrollController.scrollTo(index: (curIndex - count), duration: Duration(milliseconds: 400), curve: Curves.easeOut);
  //     curIndex -= count;
  //   }
  // }
}