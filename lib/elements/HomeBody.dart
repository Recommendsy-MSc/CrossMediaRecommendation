import 'package:cross_media_recommendation/elements/CustomSpacer.dart';
import 'package:cross_media_recommendation/elements/MyList.dart';
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
  Widget build(BuildContext context) {
    return Container(
      padding: edgeInsetsAll20,
      // decoration: testDec,
      // height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSpacer(height: 10,),
          Container(
            // padding: EdgeInsets.symmetric(horizontal: 20),
            child: ItemCard()
          ),
          CustomSpacer(height: 32,),
          MyList(),
          CustomSpacer(height: 32,),
          MyList(),
          CustomSpacer(height: 32,),
          MyList(),
          CustomSpacer(height: 32,),
          MyList(),
        ],
      ),
    );
  }
}