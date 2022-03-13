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

class TopNav extends StatefulWidget{
  Function onSubmitCallback;
  TopNav({Key? key, required this.onSubmitCallback}) : super(key: key);

  @override
  PageState createState () => PageState();
}



class PageState extends State<TopNav>{
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      // decoration: testDec,
      child: Row(
        children: [
          InkWell(
            onTap: (){
              gr.bodyMainController!.switchPage(0);
            },
            child: Text(
              "CRM",
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SearchBar(onSubmitCallback: widget.onSubmitCallback,),
                CustomSpacer(width: 50,),
                ur.loggedIn && !ur.isGuest? Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                    child: ProfileIcon()
                ) : InkWell(
                  onTap: (){
                    MyFirebase.signInWithGoogle();
                  },
                  child: ButtonComponent(title: 'Sign In', onClick: (){
                    ur.isGuest = false;
                    gr.homePageController!.setState(() { });
                  },)
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}