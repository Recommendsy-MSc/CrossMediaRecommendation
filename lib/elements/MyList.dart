import 'package:cross_media_recommendation/controllers/body_main_controller.dart';
import 'package:cross_media_recommendation/controllers/list_controller.dart';
import 'package:cross_media_recommendation/elements/CustomSpacer.dart';
import 'package:cross_media_recommendation/elements/ItemList.dart';
import 'package:cross_media_recommendation/elements/ListScrollButton.dart';
import 'package:cross_media_recommendation/elements/NoRecordFound.dart';
import 'package:cross_media_recommendation/elements/heading_element.dart';
import 'package:cross_media_recommendation/helper/constants.dart';
import 'package:cross_media_recommendation/screens/BodyMain.dart';
import 'package:flutter/cupertino.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class MyList extends StatefulWidget{
  Map<String, dynamic> data;
  MyList({Key? key, required this.data, this.showReportButton = false}) : super(key: key);
  bool showReportButton;

  @override
  PageState createState () => PageState();
}

class PageState extends StateMVC<MyList>{
  ListController? con;

  PageState() : super(ListController()){
    con = controller as ListController;
  }


  @override
  void initState(){
    super.initState();
    con!.data = widget.data;
    con!.max = widget.data['data']['result'].length;
  }
  @override
  Widget build(BuildContext context) {

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
                widget.data['data']['result'].length != 0
                    ? ListScrollButton(nextPageCB: con!.nextPage, prevPageCB: con!.prevPage,)
                    : Container()
              ],
            ),
          ),
          CustomSpacer(height: 20,),
          widget.data['data']['result'].length != 0
              ? ItemList(scrollController: con!.scrollController, listData: widget.data['data']['result'], showReportButton: widget.showReportButton,)
              : Center(child: NoRecordsFound(title: "No Titles Available",))

        ],
      ),
    );
  }


}