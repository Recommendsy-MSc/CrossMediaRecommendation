import 'package:cross_media_recommendation/controllers/reports_page_controller.dart';
import 'package:cross_media_recommendation/elements/ButtonComponent.dart';
import 'package:cross_media_recommendation/elements/CustomSpacer.dart';
import 'package:cross_media_recommendation/elements/ProfileIcon.dart';
import 'package:cross_media_recommendation/helper/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:cross_media_recommendation/repositories/user_repo.dart' as ur;
import 'package:flutter/material.dart';

class AdminSidePane extends StatefulWidget{
  ReportsPageController reportsPageController;

  AdminSidePane({Key? key, required this.reportsPageController}) : super(key: key);
  @override
  PageState createState() => PageState();
}

class PageState extends State<AdminSidePane>{
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text(
                    ur.currentUser!.name!,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
                ProfileIcon()
              ],
            ),
            // CustomSpacer(),
            Text(
              "@" + ur.currentUser!.username!,
              style: TextStyle(
                  fontSize: 14,
                  color: primaryTextColor.withOpacity(0.8)
              ),
            ),
            CustomSpacer(height: 8,),
            Text(
              "Admin",
              style: TextStyle(
                fontSize: 14,
                color: primaryTextColor.withOpacity(0.6)
              ),
            )
          ],
        ),
        ButtonComponent(title: 'Logout', onClick: widget.reportsPageController.logoutUser)
      ],
    );
  }
}