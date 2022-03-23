import 'package:flutter/animation.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../helper/constants.dart';

class ListController extends ControllerMVC{
  Map<String, dynamic>? data;
  ItemScrollController scrollController = ItemScrollController();
  // ItemPositionsListener scrollPosition = ItemPositionsListener.create();
  int curIndex = 0;
  int max = 0;

  void nextPage(){
    if(curIndex < (max-listPageCount)){
      print("scrolling next");
      scrollController.scrollTo(index: (curIndex + listPageCount), duration: Duration(milliseconds: 400), curve: Curves.easeOut);
      curIndex += listPageCount;
    }

  }

  void prevPage(){
    if(curIndex > 0){
      scrollController.scrollTo(index: (curIndex - listPageCount), duration: Duration(milliseconds: 400), curve: Curves.easeOut);
      curIndex -= listPageCount;
    }
  }
}