import 'package:cross_media_recommendation/network/rest_service.dart';
import 'package:flutter/material.dart';
import 'package:cross_media_recommendation/network/APIs.dart';
import 'package:http/http.dart' as http;

Future<void> testMovie() async{
  var qp = {
    'limit': 10,
  };
  var data = await RestService.request(endpoint: API.top_movies, queryParams: qp);
  print("Data");
  print(data);

  // var url = Uri.parse('https://172.16.1.67:8000/app/movies/top_movies');
  // var resp = await http.get(url);
  // print(resp);
}