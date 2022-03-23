import 'package:cross_media_recommendation/network/APIs.dart';
import 'package:cross_media_recommendation/network/rest_service.dart';

Future<dynamic> reportBrokenLinkForMovie(String id) async {
  var endpoint = API.movies + '/' + id + API.broken_link;
  var resp = await RestService.request(
    endpoint: endpoint
  );

  return resp['success'];
}

Future<dynamic> reportBrokenLinkForTv(String id) async{
  var endpoint = API.tv + '/' + id + API.broken_link;
  var resp = await RestService.request(
      endpoint: endpoint
  );

  return resp['success'];
}

Future<dynamic> reportInaccurateDataForTv(String id, Map<String, dynamic> data) async{
  var endpoint = API.tv + '/' + id + API.inaccurate_data;
  var resp = await RestService.request(
    endpoint: endpoint,
    data: data,
    method: 'POST'
  );

  return resp['success'];
}

Future<bool> reportInaccurateDataForMovie(String id, Map<String, dynamic> data) async{
  var endpoint = API.movies + '/' + id + API.inaccurate_data;
  var resp = await RestService.request(
      endpoint: endpoint,
      data: data,
      method: 'POST'
  );

  return resp['success'];
}

Future<bool> reportInaccurateRecommendationForMovie(String id, Map<String, dynamic> data) async{
  var endpoint = API.movies + '/' + id + API.inaccurate_recom;
  var resp = await RestService.request(
    endpoint: endpoint,
    data: data,
    method: 'POST'
  );

  return resp['success'];
}

Future<bool> reportInaccurateRecommendationForTv(String id, Map<String, dynamic> data) async{
  var endpoint = API.tv + '/' + id + API.inaccurate_recom;
  var resp = await RestService.request(
      endpoint: endpoint,
      data: data,
      method: 'POST'
  );

  return resp['success'];
}

Future<dynamic> getBrokenLinkReports({active="True"}) async{
  var resp = await RestService.request(
    endpoint: API.broken_links,
    queryParams: {
      'active': active ? "True" : "False"
    }
  );
  // printresp['success']);
  if(resp['success'] as bool) {
    // print"in");
    return resp['data'];
  }
  return [];
}

Future<dynamic> getInaccurateRecomReports({active="True"}) async{
  var resp = await RestService.request(
    endpoint: API.inaccurate_recommendations,
    queryParams: {
      'active': active ? "True" : "False"
    }
  );
  // printresp['success']);
  if(resp['success'] as bool) {
    // print"true");
    return resp['data'];
  }
  return [];
}

Future<dynamic> getInaccurateDataReports({active = "True"}) async{
  var resp = await RestService.request(
    endpoint: API.inaccurate_data_get_latest,
    queryParams: {
      'active': active ? "True" : "False"
    }
  );
  if(resp['success'] as bool) {
    return resp['data'];
  }
  return [];
}

Future<dynamic> markInaccurateDataReportAsCompleted(id) async{
  var endpoint = API.inaccurate_data + id + '/';
  var resp = await RestService.request(
    endpoint: endpoint,
    method: 'PATCH',
    data: {
      'active': false
    }
  );

  return resp['data'];
}

Future<dynamic> markInaccurateRecomAsCompleted(id) async{
  var endpoint = API.inaccurate_recommendations + id + '/';
  var resp = await RestService.request(
    endpoint: endpoint,
    method: 'PATCH',
    data: {
      'active': false
    }
  );

  return resp['success'];
}

// fetch missing title for both movies and tv
Future<dynamic> fetchMissingTitles({active=true}) async{
  var data = await RestService.request(
    endpoint: API.missing_title,
    queryParams: {
      'active': active ? "True" : "False"
    }
  );

  return data;
}

Future<dynamic> markMissingTitleAsCompleted(id, title_id) async{
  var endpoint = API.missing_title + id + '/';
  var data = await RestService.request(
    endpoint: endpoint,
    method: 'PATCH',
    data: {
      'active': false,
      'added': title_id
    },
    auth: true
  );

  return data;
}