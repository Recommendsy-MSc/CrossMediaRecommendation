import 'package:cross_media_recommendation/helper/firebase.dart';
import 'package:cross_media_recommendation/models/user_model.dart';
import 'package:cross_media_recommendation/network/APIs.dart';
import 'package:cross_media_recommendation/network/rest_service.dart';

UserModel? currentUser;
bool loggedIn = false;
bool isGuest = true;
bool isAdmin = false;
bool googleLogin = false;

Future<bool> doesUserExists(email) async{
  var resp = await  RestService.request(
    endpoint: API.users_exists,
    data: {
      'email': email
    },
    method: "POST"
  );

  if(resp['success'] as bool){
    // // print"user exists");
    currentUser = UserModel.fromJson(resp['data']['user'], token: resp['data']['token']);
    loggedIn = true;
    isAdmin = currentUser!.is_superuser!;
    googleLogin = true;
    // // printcurrentUser!.email);
    // // printcurrentUser!.token);

    return true;
  }

  return false;
}

Future<bool> createUser(data) async{
  // // printdata.toString());

  var resp = await RestService.request(
    endpoint: API.users + '/',
    data: data,
    method: 'POST'
  );
  
  if(resp['success'] as bool){
    currentUser = UserModel.fromJson(resp['data']['user'], token: resp['data']['token']);
    loggedIn = true;
    googleLogin = true;
    isGuest = false;
    isAdmin = currentUser!.is_superuser!;
    // printcurrentUser!.email);
    // printcurrentUser!.token);
    return true;
  }
  return false;
}

Future<void> logout() async{
  currentUser = null;
  if(googleLogin) {
    await MyFirebase.googleSignOut();
    googleLogin = false;
  }
  loggedIn = false;
  isGuest = true;
  isAdmin = false;
}

Future<bool> credentialsLogin({email, password}) async{
  var resp = await RestService.request(
    endpoint: API.credential_login,
    data: {
      "email": email,
      "password": password
    },
    method: 'POST'
  );

  if(resp['success']){
    currentUser = UserModel.fromJson(resp['data']['user'], token: resp['data']['token']);
    loggedIn = true;
    isGuest = false;
    isAdmin = currentUser!.is_superuser!;
    googleLogin = false;
  }

  return resp['success'];
}
