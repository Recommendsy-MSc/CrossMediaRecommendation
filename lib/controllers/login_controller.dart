import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:cross_media_recommendation/helper/firebase.dart';
import 'package:cross_media_recommendation/repositories/user_repo.dart' as ur;
import 'package:cross_media_recommendation/repositories/global_var_repo.dart' as gr;

class LoginController extends ControllerMVC{

  void guestLogin(){
    ur.isGuest = true;
    gr.homePageController!.setState(() { });
  }

  Future<void> triggerGoogleLogin() async{
    bool success = await MyFirebase.signInWithGoogle();
    if(success){
      print(MyFirebase.googleUser.toString());
      bool user_exists = await ur.doesUserExists(MyFirebase.googleUser!.email);
      if(!user_exists){
        print("doesnt exist");
        var data = {
          'email': MyFirebase.googleUser!.email,
          'name': MyFirebase.googleUser!.displayName,
          'password': 'password',
          'image_url': MyFirebase.googleUser!.photoURL,
          'birth_year': '1999',
          'username': MyFirebase.googleUser!.email!.split('@').first,
          // 'csrfmiddlewaretoken': "{{csrf_token}}"
        };

        var created = await ur.createUser(data);
        if(created){
          print("Created");
          gr.homePageController!.setState(() { });
        }else{
          print("NOt Created");
        }

      }else{
        print("exist");
        print(ur.currentUser!.image_url);
        gr.homePageController!.setState(() { });
      }
    }else{
      print("Bro please no");
    }
  }
}