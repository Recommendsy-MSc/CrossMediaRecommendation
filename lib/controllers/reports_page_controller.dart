import 'package:cross_media_recommendation/models/reports_models/broken_link_model.dart';
import 'package:cross_media_recommendation/models/reports_models/inaccurate_data_model.dart';
import 'package:cross_media_recommendation/models/reports_models/inaccurate_recom_model.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:cross_media_recommendation/repositories/user_repo.dart' as ur;
import 'package:cross_media_recommendation/repositories/global_var_repo.dart' as gr;
import 'package:cross_media_recommendation/repositories/reports_repo.dart' as rr;

class ReportsPageController extends ControllerMVC{
  List<InaccurateRecomModel> recomList = [];
  List<InaccurateDataModel> dataList = [];
  List<BrokenLinkModel> brokenLinkList = [];

  int currentReports = 0;
  Future<void> logoutUser() async{
    await ur.logout();
    gr.homePageController!.setState(() { });
  }

  void reload(){
    switchReports(currentReports);
  }

  void switchReports(index) async{
    print(currentReports);
    currentReports = index;
    setState(() { });
    switch(index){
      case 0:
        await fetchInaccurateRecommendationsReports();
        break;
      case 1:
        await fetchInaccurateDataReports();
        break;
      case 2:
        await fetchBrokenLinkReports();
        break;
    }

    setState(() {
      print(brokenLinkList.length);
      print("setting state");
    });
  }

  Future<void> fetchInaccurateRecommendationsReports() async{
    recomList = [];
    var data = await rr.getInaccurateRecomReports();
    data.forEach((element){
      recomList.add(InaccurateRecomModel.fromJson(element));
    });
  }

  Future<void> fetchInaccurateDataReports() async{
    dataList = [];
    var data = await rr.getInaccurateDataReports();
    data.forEach((element){
      dataList.add(InaccurateDataModel.fromJson(element));
    });
  }

  Future<void> fetchBrokenLinkReports() async{
    brokenLinkList = [];
    var data = await rr.getBrokenLinkReports();
    data.forEach((element){
      brokenLinkList.add(BrokenLinkModel.fromJson(element));
    });
  }
}