import 'package:dio/dio.dart';

import 'api_constants.dart';


class DioHelper {
   late Dio dio;

  DioHelper() {
    Map<String, String> _basicHeaders = Map();
    _basicHeaders['Content-Type'] = 'application/json';
    BaseOptions options = BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: 20 * 1000,
        receiveTimeout: 20 * 1000,
        receiveDataWhenStatusError: true,
        headers: _basicHeaders
    );
    dio = Dio(options);
  }

  Future<List<dynamic>> getData({
    required Map<String, dynamic> query,
  }) async {
    try {
      Response response =
      await dio.get(apiquery, queryParameters: query);
      return response.data['articles'];
    } catch (e) {
      // print(e.toString());
      return [];
    }
  }

   Future<List<dynamic>> getSearchedData(
      {required Map<String, dynamic> query}) async {
    try {
      Response response =
      await dio.get('v2/everything', queryParameters: query);
      return response.data['articles'];
    }

    catch (e) {
      print(e.toString());
      return [];
    }
  }

  formatPath(String route) {
    return  baseUrl + route;
  }
}
