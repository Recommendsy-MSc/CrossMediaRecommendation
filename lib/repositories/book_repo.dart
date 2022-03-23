import '../network/APIs.dart';
import '../network/rest_service.dart';
import 'package:cross_media_recommendation/repositories/user_repo.dart' as ur;

Future<dynamic> getTvDetail(String id) async{
  var data = await RestService.request(
      endpoint: API.books + '/' + id
  );
  return data;
}

Future<dynamic> likeBook(String? bookId) async{
  var endpoint = API.books + '/' + bookId! + API.like;
  var data = await RestService.request(
      endpoint: endpoint,
      data: {
        'user_id': ur.currentUser!.id!
      },
      method: 'POST',
      auth: true
  );
  return data;
}

Future<dynamic> dislikeBook(String? bookId) async{
  var endpoint = API.books + '/' + bookId! + API.dislike;
  var data = await RestService.request(
      endpoint: endpoint,
      data: {
        'user_id': ur.currentUser!.id!
      },
      method: 'POST',
      auth: true
  );
  return data;
}
