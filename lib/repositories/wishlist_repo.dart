import 'package:cross_media_recommendation/network/APIs.dart';
import 'package:cross_media_recommendation/network/rest_service.dart';
import 'package:cross_media_recommendation/repositories/user_repo.dart' as ur;

Future<dynamic> fetchList() async{
  var data = await RestService.request(
    endpoint: API.my_list,
    auth: true
  );

  return data['data'];
}

Future<bool> toggleWishlist({title_id, title_type}) async{
  var data = {
    'title': title_id,
    'title_type': title_type,
    'user': ur.currentUser!.id
  };

  var resp = await RestService.request(
    endpoint: API.my_list,
    auth: true,
    method: 'POST',
    data: data
  );

  return resp['success'];
}