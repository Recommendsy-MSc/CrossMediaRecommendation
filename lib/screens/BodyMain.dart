import 'package:cross_media_recommendation/controllers/body_main_controller.dart';
import 'package:cross_media_recommendation/elements/top_nav.dart';
import 'package:cross_media_recommendation/helper/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:cross_media_recommendation/repositories/global_var_repo.dart';

class BodyMain extends StatefulWidget{
  @override
  PageState createState() => PageState();
}

class PageState extends StateMVC<BodyMain>{
  BodyMainController? con;

  PageState() : super(BodyMainController()){
    con = controller as BodyMainController;
  }
  @override
  void initState(){
    super.initState();
    print("Reinit BODY MAin");
    bodyMainController = con;
    con!.switchPage(0);
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        print("will pop");
        con!.switchPage(0);
        return false;
      },
      child: Stack(
        children: [
          SingleChildScrollView(
            child: con!.bodyWidget,
          ),
          Container(
            // decoration: testDec,
              padding: edgeInsetsAll20,
              // decoration: testDec,
              child: TopNav(onSubmitCallback: con!.searchStringSubmitCallback)
          ),
        ],
      ),
    );
  }


}