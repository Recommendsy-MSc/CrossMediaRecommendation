import 'package:cross_media_recommendation/controllers/body_main_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:cross_media_recommendation/repositories/global_var_repo.dart';

class BodyMain extends StatefulWidget{
  @override
  PageState createState() => PageState();
}

class PageState extends StateMVC<BodyMain>{
  BodyMainController? con;

  PageState() : super(BodyMainController()){
    con = controller as BodyMainController;
  }
  @override
  void initState(){
    super.initState();
    bodyMainController = con;
    con!.switchPage(0);
  }
  @override
  Widget build(BuildContext context) {
    return con!.bodyWidget!;
  }


}