import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:cross_media_recommendation/repositories/user_repo.dart' as ur;
import 'package:cross_media_recommendation/repositories/global_var_repo.dart' as gr;

class ReportsPageController extends ControllerMVC{
  Future<void> logoutUser() async{
    await ur.logout();
    gr.homePageController!.setState(() { });
  }
}