import 'package:cross_media_recommendation/controllers/body_main_controller.dart';
import 'package:cross_media_recommendation/elements/SidePane.dart';
import 'package:cross_media_recommendation/elements/top_nav.dart';
import 'package:cross_media_recommendation/helper/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:cross_media_recommendation/repositories/global_var_repo.dart' as gr;

class BodyMain extends StatefulWidget{
  BodyMain({Key? key}) : super(key: key);
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
    gr.bodyMainController = con;
    print("SIW PAGE");
    con!.switchPage(0);
  }
  @override
  Widget build(BuildContext context) {
    print("Building BODY MAIN");
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height,
      ),
      child: Stack(
        children: [
          GestureDetector(
            onTap: (){
              if(con!.showSidePane) {
                con!.toggleSidePane();
              }
            },
            child: con!.bodyWidget!
          ),
          Container(
            // decoration: testDec,
              padding: EdgeInsets.symmetric(horizontal: 20),
              // decoration: testDec,
              child: TopNav(bodyMainController: con!)
          ),
          Visibility(
            visible: con!.showSidePane,
            child: Align(
              alignment: Alignment.centerRight,
              child: Stack(
                alignment: Alignment.centerRight,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      color: primaryColor
                    ),
                    child: SidePane(),
                  ),
                  Transform.translate(
                    offset: Offset(-MediaQuery.of(context).size.width * 0.2 + 25, -MediaQuery.of(context).size.height/3),
                    child: InkWell(
                      onTap: (){
                        con!.toggleSidePane();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: accentColor
                        ),
                        child: Icon(
                          Icons.chevron_right
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }


}