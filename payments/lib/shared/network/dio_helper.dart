import 'package:dio/dio.dart';
import 'package:payments/shared/components/constants.dart';

class DioHelper {
  static late Dio dio;

  //declare the baseUrl for the API and initialise the dio
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: apiUrl,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  //post method from the API
  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required dynamic data,
  }) async {
    dio.options.method = "POST";
    dio.options.headers = {
      'Content-Type': 'application/json',
    };
    return await dio.post(
      url,
      data: data,
      queryParameters: query,
    );
  }

  //get method from the API
  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
  }) async {
    dio.options.method = "GET";
    dio.options.headers = {
      'Content-Type': 'application/json',
    };
    return await dio.get(
      url,
      queryParameters: query,
    );
  }
}
