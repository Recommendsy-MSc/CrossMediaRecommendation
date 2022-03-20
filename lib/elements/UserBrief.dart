import 'package:cross_media_recommendation/elements/CustomSpacer.dart';
import 'package:cross_media_recommendation/elements/ProfileIcon.dart';
import 'package:cross_media_recommendation/helper/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cross_media_recommendation/repositories/user_repo.dart' as ur;

class UserBrief extends StatefulWidget{
  @override
  PageState createState() => PageState();
}

class PageState extends State<UserBrief>{
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ProfileIcon(),
        CustomSpacer(width: 10,),
        Container(
          child: Text(
            ur.currentUser!.name!,
            style: TextStyle(
              color: primaryTextColor.withOpacity(0.7)
            ),
          )
        )
      ],
    );
  }
}