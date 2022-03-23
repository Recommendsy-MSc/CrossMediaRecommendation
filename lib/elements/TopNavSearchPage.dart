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

class TopNavSearchPage extends StatefulWidget{
  TopNavSearchPage({Key? key,}) : super(key: key);

  @override
  PageState createState () => PageState();
}



class PageState extends State<TopNavSearchPage>{
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      // decoration: testDec,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          // CustomSpacer(width: 30,),

          SearchBar(),
        ],
      ),
    );
  }
}