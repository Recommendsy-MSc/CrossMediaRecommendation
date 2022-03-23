import 'package:cross_media_recommendation/controllers/wishlist_controller.dart';
import 'package:cross_media_recommendation/elements/ItemTile.dart';
import 'package:cross_media_recommendation/elements/heading_element.dart';
import 'package:cross_media_recommendation/helper/constants.dart';
import 'package:cross_media_recommendation/models/basic_title_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../elements/CustomSpacer.dart';
import '../elements/Loader.dart';
import '../elements/MyList.dart';
import 'package:cross_media_recommendation/repositories/user_repo.dart' as ur;

class MyWishListScreen extends StatefulWidget{
  @override
  PageState createState() => PageState();
}

class PageState extends StateMVC<MyWishListScreen>{
  WishListScreenController? con;

  PageState() : super(WishListScreenController()){
    con = controller as WishListScreenController;
  }

  @override
  void initState(){
    super.initState();
    con!.fetchMyList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 80, left: 20, right: 20, bottom: 20),
      height: double.infinity,
      // decoration: testDec,
      // height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeadingElement(title: "My List"),
          CustomSpacer(height: 20,),
          con!.tabDataLoaded
              ? con!.hasAny
              ? Expanded(
                child: GridView.builder(
            itemBuilder: (context, index){
                BasicTitleModel titleModel = BasicTitleModel.fromJson(con!.defaultListData[index]);
                return ItemTile(parentHeight: (MediaQuery.of(context).size.width * bodyMainWidthRatio - listPageCount*16-24)/listPageCount * 513/342,parentWidth: (MediaQuery.of(context).size.width * bodyMainWidthRatio - listPageCount*16 - 24) / listPageCount, titleModel: titleModel);
            },
            itemCount: con!.defaultListData.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: listPageCount,
                childAspectRatio: 342/(512+(ur.loggedIn ? 50 : 0)),
                crossAxisSpacing: 8,
                mainAxisSpacing: 8
            ),
          ),
              )
              : Container(
              child: Text("NO Available")
          )
              : Center(child: Loading(color: primaryTextColor,)),
        ],
      ),
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