import 'package:cross_media_recommendation/app_config.dart';
import 'package:cross_media_recommendation/helper/custom_trace.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:cross_media_recommendation/repositories/user_repo.dart' as userRepo;

class RestService{
  static Dio? dio;
  static String baseUrl = AppConfig.config!.baseUrl!;

  static void init(){
    dio = Dio(
      BaseOptions(baseUrl: baseUrl)
    );
    dio!.interceptors.add(AppInterceptors());
    // dio!.interceptors.add(InterceptorsWrapper(
    //   onError: (DioError er, ErrorInterceptorHandler h){
    //     // printer.requestOptions.uri) ;
    //     print
    //     return h.next(er);
    //   }
    // ));
    // dio!.interceptors.add(InterceptorsWrapper(
    //   onRequest: (RequestOptions options, RequestInterceptorHandler handler){
    //     // printoptions.path);
    //   }
    // ));

  }

  static Future<dynamic> request(
    {
      required String endpoint,
      String method = 'GET',
      bool auth = false,
      Map<String, dynamic> queryParams = const {},
      dynamic data = const {},
      bool showLoader = false,
    }) async {
      try{
        String language = 'es';

        Options _cacheOptions = Options();
        _cacheOptions.method = method;
        _cacheOptions.headers = {
          'accept-language': language,
          'authrequired': auth
        };

        Response<dynamic> response = await dio!.request(
          '$endpoint',
          data: data,
          queryParameters: queryParams,
          options:_cacheOptions
        );

        var res = response.data;
        // printresponse.requestOptions.method);
        // printresponse.requestOptions.baseUrl + response.requestOptions.path);
        // printresponse.requestOptions.queryParameters);
        // printresponse.requestOptions.data.toString());
        // printres);
        return res;

      }catch(e){
        CustomTrace(StackTrace.current, message: e.toString());
        // print"Error: " + e.toString());
    }

    }
}

class AppInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    super.onRequest(options, handler);
    // options.headers.addAll({
    //   'x-client-id': AppConfig.config.clientId,
    //   'x-client-device': AppConfig.config.clientDevice,
    // });
    if (options.headers['authrequired'] == true) {
      options.headers.remove("authrequired");
      options.headers.addAll({
        'Authorization': 'Token ' + userRepo.currentUser!.token!,
        'Access-Control-Allow-Origin': '*'
      });

      // return options;
    }else{
      options.headers.remove('authrequired');
    }
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // printresponse.headers);
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    // print'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    // printerr.requestOptions.uri);
    // printerr.requestOptions.queryParameters);
    // printerr.requestOptions.data);
    super.onError(err, handler);
  }

}