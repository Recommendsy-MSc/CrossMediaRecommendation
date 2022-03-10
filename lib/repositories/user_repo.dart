import 'package:cross_media_recommendation/models/user_model.dart';
import 'package:cross_media_recommendation/network/APIs.dart';
import 'package:cross_media_recommendation/network/rest_service.dart';

UserModel? currentUser;
bool loggedIn = false;
bool isGuest = false;

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
    print(currentUser!.email);
    print(currentUser!.token);

    return true;
  }

  return false;
}

Future<bool> createUser(data) async{
  var resp = await RestService.request(
    endpoint: API.users + '/',
    data: data
  );
  
  if(resp['success'] as bool){
    currentUser = UserModel.fromJson(resp['data']['user'], token: resp['data']['token']);
    loggedIn = true;
    print(currentUser!.email);
    print(currentUser!.token);
    return true;
  }
  return false;
}
