import 'package:cross_media_recommendation/helper/FToastHelper.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:cross_media_recommendation/helper/firebase.dart';
import 'package:cross_media_recommendation/repositories/user_repo.dart' as ur;
import 'package:cross_media_recommendation/repositories/global_var_repo.dart' as gr;

class LoginController extends ControllerMVC{
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void guestLogin(){
    ur.isGuest = true;
    // gr.homePageController!.setState(() { });
    Navigator.of(state!.context).pushNamed('/HomePage');
  }

  Future<void> triggerGoogleLogin() async{
    bool success = await MyFirebase.signInWithGoogle();
    if(success){
      // printMyFirebase.googleUser.toString());
      bool user_exists = await ur.doesUserExists(MyFirebase.googleUser!.email);
      if(!user_exists){
        // print"doesnt exist");
        var data = {
          'email': MyFirebase.googleUser!.email,
          'name': MyFirebase.googleUser!.displayName,
          'password': 'password',
          'image_url': MyFirebase.googleUser!.photoURL,
          'birth_year': '1999',
          'username': MyFirebase.googleUser!.email!.split('@').first,
        };

        var created = await ur.createUser(data);
        if(created){
          // print"Created");
          // gr.homePageController!.setState(() { });
          Navigator.of(state!.context).pushNamedAndRemoveUntil('/HomePage', (route) => false);
        }else{
          // print"NOt Created");
        }

      }else{
        // print"exist");
        // printur.currentUser!.image_url);
        // gr.homePageController!.setState(() { });
        if(ur.currentUser!.is_superuser!){
          Navigator.of(state!.context).pushNamedAndRemoveUntil('/ReportPage', (route) => false);
        }else{
          Navigator.of(state!.context).pushNamedAndRemoveUntil('/HomePage', (route) => false);
        }


      }
    }else{
      // print"Bro please no");
    }
  }

  Future<void> doCredentialLogin() async{
    gr.showLoader(state!.context);
    var success = await ur.credentialsLogin(email: emailController.text, password: passwordController.text);
    gr.hideLoader(state!.context);
    if(success){
      if(ur.currentUser!.is_superuser!){
        Navigator.of(state!.context).pushNamedAndRemoveUntil('/ReportPage', (route) => false);
      }else{
        Navigator.of(state!.context).pushNamedAndRemoveUntil('/HomePage', (route) => false);
      }
    }else{
      CustomToast(context: state!.context, msg: "Invalid Credentials!").showToast();
    }
  }
}