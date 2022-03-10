import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';


class MyFirebase{
  static FirebaseAuth auth = FirebaseAuth.instance;
  static User? googleUser;
  static final GoogleSignIn googleSignIn = GoogleSignIn();


  static Future<void> initializeFirebase() async{
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyD6DmqwfyCiA6tGf1vVbUsfpq5jTukjQQA",
        appId: "1:960678949124:web:a03eeb1d4604eaeb57e051",
        messagingSenderId: "960678949124",
        projectId: "crossmediarecommendation",
        authDomain: "crossmediarecommendation.firebaseapp.com",
      )
    );
    print("firebase initializer");
  }

  static Future<bool> signInWithGoogle() async{
    GoogleAuthProvider authProvider = GoogleAuthProvider();
    try{
      final UserCredential userCred = await auth.signInWithPopup(authProvider);
      googleUser = userCred.user;
      print(googleUser!.email);
      return true;
    }catch(e){
      print(e);
      return false;
    }
    return false;
  }

  static Future<void> googleSignOut() async{
    await googleSignIn.signOut();
    await auth.signOut();
  }
}