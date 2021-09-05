import 'package:blue_squad_app/shared/network/end_points.dart';
import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: BASE_URL,
      ),
    );
  }

  static Future<Response> postData({
    required Map<String, dynamic> data,
    required String url,
    String? token,
}) {
    return dio.post(
      url,
      data: data,
      options: Options(
        headers: {
          'lang':'en',
          'Content-Type':'application/json',
          'Authorization':token??'',
        },
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    String? token,
    Map<String, dynamic>? query,
  }) {
    return dio.get(
      url,
      options: Options(
        headers: {
          'lang':'en',
          'Content-Type':'application/json',
          'Authorization':token??'',
        },
      ),
      queryParameters: query,
    );
  }

}