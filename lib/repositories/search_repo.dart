import 'package:cross_media_recommendation/network/APIs.dart';
import 'package:cross_media_recommendation/network/rest_service.dart';

Future<dynamic> searchString(search_string) async{
  var data = await RestService.request(
    endpoint: API.search,
    queryParams: {
      'q': search_string,
      'order_by': '-popularity'
    },
    auth: true
  );

  return data;
}