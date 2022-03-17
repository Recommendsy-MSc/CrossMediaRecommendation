import 'package:cross_media_recommendation/helper/firebase.dart';
import 'package:cross_media_recommendation/models/user_model.dart';
import 'package:cross_media_recommendation/network/APIs.dart';
import 'package:cross_media_recommendation/network/rest_service.dart';

UserModel? currentUser;
bool loggedIn = false;
bool isGuest = true;
bool isAdmin = false;

Future<bool> doesUserExists(email) async{
  var resp = await  RestService.request(
    endpoint: API.users_exists,
    data: {
      'email': email
    },
    method: "POST"
  );

  if(resp['success'] as bool){
    print("user exists");
    currentUser = UserModel.fromJson(resp['data']['user'], token: resp['data']['token']);
    loggedIn = true;
    isAdmin = currentUser!.is_superuser!;
    print(currentUser!.email);
    print(currentUser!.token);

    return true;
  }

  return false;
}

Future<bool> createUser(data) async{
  print(data.toString());

  var resp = await RestService.request(
    endpoint: API.users + '/',
    data: data,
    method: 'POST'
  );
  
  if(resp['success'] as bool){
    currentUser = UserModel.fromJson(resp['data']['user'], token: resp['data']['token']);
    loggedIn = true;
    isAdmin = currentUser!.is_superuser!;
    print(currentUser!.email);
    print(currentUser!.token);
    return true;
  }
  return false;
}

Future<void> logout() async{
  await MyFirebase.googleSignOut();
  loggedIn = false;
  isGuest = true;
  isAdmin = false;

}
