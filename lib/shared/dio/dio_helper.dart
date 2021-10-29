import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dioHelper;
  static initial() {
    dioHelper = Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> get(String url, Map<String, dynamic> query) async =>
      dioHelper.get(url, queryParameters: query);
}
