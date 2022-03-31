import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    if (kDebugMode) {
      print('dioHelper Initialized');
    }
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://mohamedameer.pythonanywhere.com/api/',
        receiveDataWhenStatusError: true,
        connectTimeout: 20 * 1000,
        receiveTimeout: 20 * 1000,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
    Map<String, dynamic>? data,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Token $token'
    };
    return await dio.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
    String? token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Token e8a41a1227f88dbbe80750ab22ec246777fbe4d9'
    };
    return await dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> putData(
      {required String url,
        Map<String, dynamic>? query,
        Map<String, dynamic>? data,
        String? token}) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Token {{admin_token}}'
    };
    return await dio.put(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> deleteData({
    required String url,
    String lang = 'en',
    String? token,
  }) async {
    dio.options.headers = {
      'lang': lang,
      'Content-Type': 'application/json',
      'Authorization': 'Token $token'
    };
    return await dio.delete(url);
  }
}
