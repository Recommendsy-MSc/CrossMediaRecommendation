import 'package:cross_media_recommendation/models/basic_title_model.dart';
import 'package:cross_media_recommendation/models/reports_models/missing_title_model.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:cross_media_recommendation/repositories/global_var_repo.dart' as gr;

class ReportTileController extends ControllerMVC{
  Function? reloadCallback;
  // for edit title, inacc data reports only
  Future<bool> gotoTitle({String? id, int? type, String? reportId}) async{
    var data = {
      'id': id,
      'type': type,
      'reportId': reportId
    };
    // gr.adminBodyMainController!.switchPage(1, data: data);
    Navigator.of(state!.context).pushNamed('/EditableTitlePage', arguments: data).then((value){
      print("VAlue: " + value.toString());
      if(value == true){
        reloadCallback!();
        return true;
      }else{
        return false;
      }
    });
    print("returning false");
    return false;
  }

  Future<void> gotToMissingTitle({MissingTitleModel? object}) async{
    Navigator.of(state!.context).pushNamed('/AdminSuggestedTitles', arguments: object!).then((value){
      if(value == true){
        reloadCallback!();
      }
    });
    // gr.adminBodyMainController!.switchPage(2, data: object!);
  }
}