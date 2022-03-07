import 'package:cross_media_recommendation/controllers/list_controller.dart';
import 'package:cross_media_recommendation/elements/CustomSpacer.dart';
import 'package:cross_media_recommendation/elements/ItemList.dart';
import 'package:cross_media_recommendation/elements/ListScrollButton.dart';
import 'package:cross_media_recommendation/elements/heading_element.dart';
import 'package:cross_media_recommendation/helper/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class MyList extends StatefulWidget{
  Map<String, dynamic> data;
  MyList({Key? key, required this.data}) : super(key: key);

  @override
  PageState createState () => PageState();
}

class PageState extends StateMVC<MyList>{
  ListController? con;

  PageState() : super(ListController()){
    con = controller as ListController;
  }

  ItemScrollController scrollController = ItemScrollController();
  ItemPositionsListener scrollPosition = ItemPositionsListener.create();
  int curIndex = 0;
  int count = 0;
  int max = 13;
  @override
  void initState(){
    super.initState();
    con!.data = widget.data;
  }
  @override
  Widget build(BuildContext context) {
    print("rendering list");
    // print(MediaQuery.of(context).size.width * 0.7);
    // print(MediaQuery.of(context).size.width * 0.18);
    count = 5;
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
                HeadingElement(title: widget.data['data']['list_header'],),
                ListScrollButton(nextPageCB: nextPage, prevPageCB: prevPage,),
              ],
            ),
          ),
          CustomSpacer(height: 10,),
          ItemList(scrollController: scrollController, listData: widget.data['data']['result'],)
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