import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:path_provider/path_provider.dart';

import 'dio_interceptor.dart';

class DioClient{
  static Dio? dio;

  static init(String baseUrl) async{
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    var cookieJar = PersistCookieJar(storage: FileStorage("$appDocPath/.cookies"));
    dio= Dio(BaseOptions(
      baseUrl: '$baseUrl/api'
    ))..interceptors.addAll([
      CookieManager(cookieJar),
      DioInterceptor()
    ]);
  }
}