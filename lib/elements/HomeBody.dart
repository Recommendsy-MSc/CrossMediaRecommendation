import 'package:cross_media_recommendation/controllers/body_main_controller.dart';
import 'package:cross_media_recommendation/controllers/home_body_controller.dart';
import 'package:cross_media_recommendation/elements/CustomSpacer.dart';
import 'package:cross_media_recommendation/elements/MyList.dart';
import 'package:cross_media_recommendation/elements/MyList2.dart';
import 'package:cross_media_recommendation/elements/TodaysPick.dart';
import 'package:cross_media_recommendation/helper/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import 'ItemCard.dart';

class HomeBody extends StatefulWidget{
  HomeBody({Key? key, }) : super(key: key);

  @override
  PageState createState () => PageState();
}


class PageState extends StateMVC<HomeBody>{
  HomeBodyController? con;

  PageState() : super(HomeBodyController()){
    con = controller as HomeBodyController;
  }

  @override
  void initState(){
    super.initState();
    con!.loadHomeData();
  }



  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 100, left: 20, right: 20, bottom: 20),
        height: double.infinity,
        // decoration: testDec,
        // height: MediaQuery.of(context).size.height,
        child: con!.defaultListLoaded ? ListView.builder(
          // shrinkWrap: true,
          physics: AlwaysScrollableScrollPhysics(),
          itemCount: con!.defaultListData.length,
          itemBuilder: (context, index){
            return Column(
              children: [
                MyList(data: con!.defaultListData[index],),
                CustomSpacer(height: 30,),
              ],
            );
          },
        ) : Center(child: CircularProgressIndicator()),
        // child: con!.defaultListLoaded ? Column(
        //   children: con!.defaultListData.map((element) {
        //     return Column(
        //       children: [
        //         MyList(data: element,),
        //         CustomSpacer(height: 30,),
        //       ],
        //     );
        //   }).toList()
        // ) : CircularProgressIndicator()
    );
  }

}