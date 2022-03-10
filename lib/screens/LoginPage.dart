import 'package:cached_network_image/cached_network_image.dart';
import 'package:cross_media_recommendation/controllers/login_controller.dart';
import 'package:cross_media_recommendation/elements/CustomSpacer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:cross_media_recommendation/helper/constants.dart';

class LoginPage extends StatefulWidget{
  @override
  PageState createState() => PageState();
}

class PageState extends StateMVC<LoginPage>{
  LoginController? con;

  PageState() : super(LoginController()){
    con = controller as LoginController;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: primaryColor
        ),
        child: Container(
          alignment: Alignment.center,
          padding: edgeInsetsAll32,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                child: Text(
                  "Cross Media Recommendation",
                  style: Theme.of(context).textTheme.headline1
                )
              ),
              CustomSpacer(height: 50,),
              Column(
                children: [
                  InkWell(
                    onTap: (){
                      con!.triggerGoogleLogin();
                    },
                    child: Container(
                      padding: edgeInsetsAll12,
                      decoration: BoxDecoration(
                        color: primaryTextColor,
                        borderRadius: borderRadius20
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/img/google.png',
                            height: MediaQuery.of(context).size.height * 0.05,
                          ),
                          CustomSpacer(),
                          Container(
                            child: Text(
                              "Sign in with Google",
                              style: TextStyle(
                                fontSize: 16
                              )
                            )
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              CustomSpacer(height: 20,),
              InkWell(
                onTap: (){
                  con!.guestLogin();
                },
                child: Container(
                  padding: edgeInsetsAll12,
                  child: Container(
                      child: Text(
                          "Guest User",
                          style: TextStyle(
                            color: primaryTextColor.withOpacity(0.7),
                            fontSize: 16
                          )
                      )
                  ),
                ),
              )
            ],
          )
        )
      ),
    );
  }
}