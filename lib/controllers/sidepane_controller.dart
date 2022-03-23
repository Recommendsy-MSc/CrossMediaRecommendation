import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:cross_media_recommendation/repositories/user_repo.dart' as ur;
import 'package:cross_media_recommendation/repositories/global_var_repo.dart' as gr;

class SidePaneController extends ControllerMVC{
  Future<void> logout() async{

    await ur.logout();
    // gr.homePageController!.setState(() { });
    Navigator.of(state!.context).pushNamedAndRemoveUntil('/HomePage', (route) => false);
  }

}