import 'package:cross_media_recommendation/elements/MissingTitleReportTile.dart';
import 'package:cross_media_recommendation/elements/SuggestedTitleTile.dart';
import 'package:cross_media_recommendation/models/reports_models/broken_link_model.dart';
import 'package:cross_media_recommendation/models/reports_models/inaccurate_data_model.dart';
import 'package:cross_media_recommendation/models/reports_models/inaccurate_recom_model.dart';
import 'package:cross_media_recommendation/models/reports_models/missing_title_model.dart';
import 'package:cross_media_recommendation/models/suggested_title_model.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:cross_media_recommendation/repositories/user_repo.dart' as ur;
import 'package:cross_media_recommendation/repositories/global_var_repo.dart' as gr;
import 'package:cross_media_recommendation/repositories/reports_repo.dart' as rr;
import 'package:cross_media_recommendation/repositories/search_repo.dart' as sr;


class ReportsPageController extends ControllerMVC{
  List<InaccurateRecomModel> recomList = [];
  List<InaccurateDataModel> dataList = [];
  List<BrokenLinkModel> brokenLinkList = [];
  List<MissingTitleModel> missingTitlesList = [];
  List<SuggestedTitleModel> suggestedTitlesList = [];
  bool showSuggestedPreview = false;
  SuggestedTitleModel? previewModel;

  int currentReports = 0;
  Future<void> logoutUser() async{
    await ur.logout();
    gr.bodyMainController!.toggleSidePane();
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
        // await fetchBrokenLinkReports();
        await fetchMissingTitleReports();
        break;
    }

    setState(() {
      print("setting state");
    });
  }

  Future<void> fetchMissingTitleReports() async{
    missingTitlesList = [];
    var data = await rr.fetchMissingTitles();
    data['data'].forEach((element){
      missingTitlesList.add(MissingTitleModel.fromJson(element));
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

  Future<void> fetchSuggestionsForMissing({search_string, type=0}) async{
    suggestedTitlesList = [];
    dynamic data;
    if(type == 0){
      data = await sr.searchTbdbMovie(search_string);
    }else{
      data = await sr.searchTbdbTv(search_string);
    }
    data['data']['result'].forEach((element){
      suggestedTitlesList.add(SuggestedTitleModel.fromJson(element));
    });
    setState(() { });
  }

  void switchSuggestedTitlePreview(object){
    previewModel = object;
    showSuggestedPreview = true;
    setState(() { });
  }
}