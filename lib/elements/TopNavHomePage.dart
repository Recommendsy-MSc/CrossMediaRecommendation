import 'package:cross_media_recommendation/controllers/body_main_controller.dart';
import 'package:cross_media_recommendation/elements/AppTitle.dart';
import 'package:cross_media_recommendation/elements/ButtonComponent.dart';
import 'package:cross_media_recommendation/elements/CustomSpacer.dart';
import 'package:cross_media_recommendation/elements/SearchBar.dart';
import 'package:cross_media_recommendation/helper/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cross_media_recommendation/helper/firebase.dart';
import 'ProfileIcon.dart';
import 'package:cross_media_recommendation/repositories/user_repo.dart' as ur;
import 'package:cross_media_recommendation/repositories/global_var_repo.dart' as gr;

class TopNavHomePage extends StatefulWidget{
  BodyMainController bodyMainController;
  TopNavHomePage({Key? key, required this.bodyMainController}) : super(key: key);

  @override
  PageState createState () => PageState();
}



class PageState extends State<TopNavHomePage>{
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      // decoration: testDec,
      child: Row(
        children: [
          InkWell(
            onTap: (){
              Navigator.of(context).pushNamedAndRemoveUntil('/HomePage', (route) => false);
            },
            child: Text(
              "CRM",
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          CustomSpacer(width: 30,),
          Row(
            children: widget.bodyMainController.tabs.map((e){
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 12),
                child: InkWell(
                  onTap: (){
                    if(widget.bodyMainController.tabs.indexOf(e) == 2){
                      if(ur.loggedIn){
                        widget.bodyMainController.switchPage(widget.bodyMainController.tabs.indexOf(e));
                      }else{
                        Navigator.of(context).pushNamed('/LoginPage');
                      }
                    }else{
                      widget.bodyMainController.switchPage(widget.bodyMainController.tabs.indexOf(e));
                    }

                  },
                  child: Text(
                    e.toString(),
                    style: TextStyle(
                        color: primaryTextColor.withOpacity(0.5),
                        letterSpacing: 1.005
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SearchBar(),
                widget.bodyMainController.showSidePane ? CustomSpacer(width: MediaQuery.of(context).size.width * 0.2,) : CustomSpacer(width: 50,),
                ur.loggedIn && !ur.isGuest? InkWell(
                  onTap: (){
                    gr.bodyMainController!.toggleSidePane();
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                      child: ProfileIcon()
                  ),
                ) : InkWell(
                  onTap: (){
                    MyFirebase.signInWithGoogle();
                  },
                  child: ButtonComponent(title: 'Sign In', onClick: (){
                    ur.isGuest = false;
                    // gr.homePageController!.setState(() { });
                    Navigator.of(context).pushNamed('/LoginPage');
                  },)
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}