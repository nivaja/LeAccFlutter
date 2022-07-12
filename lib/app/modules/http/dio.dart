import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart' as getx;

import 'package:path_provider/path_provider.dart';

import 'dio_interceptor.dart';

class DioClient {
  static final DioClient _dioClient = DioClient._internal();
  static Dio? dio;

  factory DioClient() {
    return _dioClient;
  }

  DioClient._internal();

  static init(String baseUrl) async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    var cookieJar =
        PersistCookieJar(storage: FileStorage("$appDocPath/.cookies"));
    dio = Dio(BaseOptions(baseUrl: baseUrl))
      ..interceptors.addAll([CookieManager(cookieJar), DioInterceptor()]);
  }

  Future<Response?> post(String endpoint, {Map<String, dynamic>? data}) async {
    try {
      EasyLoading.show(
          maskType: EasyLoadingMaskType.black,
          indicator: CircularProgressIndicator(backgroundColor: Colors.white),
          status: 'Saving...');
      Response? response = await dio?.post(endpoint, data: data);

      return response;
    } on Exception catch (e) {
      getx.Get.defaultDialog(title: 'Error', middleText: e.toString());
    }finally{
      EasyLoading.dismiss();
    }
  }
}
