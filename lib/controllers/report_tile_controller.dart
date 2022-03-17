import 'package:cross_media_recommendation/models/basic_title_model.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:cross_media_recommendation/repositories/global_var_repo.dart' as gr;

class ReportTileController extends ControllerMVC{
  Future<void> gotoTitle({String? id, int? type, String? reportId}) async{
    var data = {
      'id': id,
      'type': type,
      'reportId': reportId
    };
    gr.adminBodyMainController!.switchPage(1, data: data);
  }
}