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
        apiKey: "AIzaSyB2Vh7IY44mzNtqr1ZWqE69qKxbpouiTJs",
        appId: "1:642751109396:web:201b7423e92049ede08a01",
        messagingSenderId: "642751109396",
        projectId: "crossmr-fa129",
        authDomain: "crossmr-fa129.firebaseapp.com",
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


  // dont touch
  static Future<void> googleSignOut() async{
    try{
      final curUser = googleSignIn.currentUser ?? await googleSignIn.signIn();
      if(curUser != null){
        await googleSignIn.disconnect();
      }
      await auth.signOut();
      await googleSignIn.signOut();
    }catch(e){
      print(e);
    }

  }
}