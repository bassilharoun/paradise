import 'package:avanced_course/app/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';


const String APPLICATION_JSON = "application/json";
const String CONTENT_TYPE = "content-type";
const String ACCEPT = "accept";
const String AUTHORIZATION = "authorization";
const String DEFAULT_LANGUAGE = "language";

class DioFactory{

  Future<Dio> getDio() async {
    Dio dio = Dio();

    Map<String, String> headers = {
      CONTENT_TYPE : APPLICATION_JSON,
      ACCEPT : APPLICATION_JSON,
      AUTHORIZATION : Constants.token, // todo
      DEFAULT_LANGUAGE : "en" // todo
    };

    dio.options = BaseOptions(
      baseUrl: Constants.baseUrl,
      headers: headers,
      receiveTimeout: const Duration(milliseconds: Constants.apiTimeOut),
      sendTimeout: const Duration(milliseconds: Constants.apiTimeOut)
    );

    if(kReleaseMode){
      print("Sorry man there is no logs ;)");
    }else{
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true
      ));

    }

    return dio;

  }
}