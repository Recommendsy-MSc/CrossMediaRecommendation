import 'package:cross_media_recommendation/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';



class MyFirebase{
  static FirebaseAuth auth = FirebaseAuth.instance;
  static User? googleUser;
  static final GoogleSignIn googleSignIn = GoogleSignIn(clientId: '23311864855-t0abqsm8ha9gvrcksts6mebkt5b4j946.apps.googleusercontent.com');
  // static final GoogleSignInPlugin gplugin = GoogleSignInPlatform.instance as GoogleSignInPlugin;


  static Future<void> initializeFirebase() async{
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
    );
    // await gplugin.initWithParams(const SignInInitParameters(
    //   clientId: "23311864855-t0abqsm8ha9gvrcksts6mebkt5b4j946.apps.googleusercontent.com"
    // ));
    print("firebase initializer");
  }

  static Future<bool> signInWithGoogle() async{
    // // GoogleAuthProvider authProvider = GoogleAuthProvider();
    // try{
    //   final GoogleSignInAccount account = (await googleSignIn.signIn())!;
    //   print("In");
    //   // final UserCredential userCred = await auth.signInWithPopup(authProvider);
    //
    //   // googleUser = userCred.user;
    //   // print(account.email);
    //   // print(googleUser!.email);
    //   print(await googleSignIn.isSignedIn());
    //   return true;
    // }catch(e){
    //   print(e);
    //   return false;
    // }

    try{
      GoogleAuthProvider googleProvider = GoogleAuthProvider();
      UserCredential cred = await FirebaseAuth.instance.signInWithPopup(googleProvider);
      googleUser = cred.user;
      print(googleUser!.email);
      return true;
    }catch(e){
      print(e);
      return false;
    }
  }


  // dont touch
  static Future<void> googleSignOut() async{
    try{
      // await gplugin.signOut();
      await FirebaseAuth.instance.signOut();
      await googleSignIn.signOut();
      await googleSignIn.disconnect();
      // await googleSignIn.signOut();
      // await googleSignIn.disconnect();
    }
    catch(e){
      print("Auth signout Exception: " + e.toString());
    }

    // try{
    //   await googleSignIn.signOut();
    // }catch(e){
    //   print("Signout error: " + e.toString());
    // }


  }
}
