import 'package:blue_squad_app/shared/network/end_points.dart';
import 'package:dio/dio.dart';

class DioHelper
{
  static Dio dio;

  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: BASE_URL,
      ),
    );
  }

  static Future<Response> postData(Map<String, dynamic> data) {
    return dio.post(
      LOGIN,
      data: data,
      options: Options(
        headers: {
          'lang':'ar',
          'Content-Type':'application/json',
        },
      ),
    );
  }
}