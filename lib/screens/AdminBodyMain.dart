import 'package:cross_media_recommendation/elements/TopNavHomePage.dart';
import 'package:cross_media_recommendation/helper/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:cross_media_recommendation/repositories/global_var_repo.dart' as gr;

import '../controllers/admin_body_main_controller.dart';

class AdminBodyMain extends StatefulWidget{
  @override
  PageState createState() => PageState();
}

class PageState extends StateMVC<AdminBodyMain>{
  AdminBodyMainController? con;

  PageState() : super(AdminBodyMainController()){
    con = controller as AdminBodyMainController;
  }

  @override
  void initState(){
    super.initState();
    print("Reinit BODY MAin");
    gr.adminBodyMainController = con;
    con!.switchPage(0, data: 0);
  }
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height,
      ),
      child: con!.bodyWidget!,
    );
  }


}