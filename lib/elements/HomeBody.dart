import 'package:cross_media_recommendation/elements/CustomSpacer.dart';
import 'package:cross_media_recommendation/elements/MyList.dart';
import 'package:cross_media_recommendation/elements/MyList2.dart';
import 'package:cross_media_recommendation/elements/TodaysPick.dart';
import 'package:cross_media_recommendation/helper/constants.dart';
import 'package:flutter/cupertino.dart';

import 'ItemCard.dart';

class HomeBody extends StatefulWidget{
  HomeBody({Key? key}) : super(key: key);

  @override
  PageState createState () => PageState();
}


class PageState extends State<HomeBody>{

  @override
  void initState(){
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Stack(
      // alignment: Alignment.bottomCenter,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // CustomSpacer(height: 10,),
        Container(
          // padding: EdgeInsets.symmetric(horizontal: 20),
          child: ItemCard()
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: EdgeInsets.only(top: 350, left: 40, right: 40),
            // height: 300,
            // decoration: testDec,
            padding: edgeInsetsAll12,
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.9)
            ),
            child: Column(
              children: [
                CustomSpacer(height: 16,),
                MyList2(),
                CustomSpacer(height: 16,),
                MyList2(),
                CustomSpacer(height: 16,),
                MyList2(),
                CustomSpacer(height: 16,),
                MyList2(),
                CustomSpacer(height: 16,),
                // CustomSpacer(height: 32,),
                // MyList(),
                // CustomSpacer(height: 32,),
                // MyList(),
                // CustomSpacer(height: 32,),
                // MyList(),
                // CustomSpacer(height: 32,),
                // MyList(),
              ],
            ),
          ),
        )

      ],
    );
  }


}