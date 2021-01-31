import 'package:dio/dio.dart';

class NetworkUtil {
  static NetworkUtil _instance = new NetworkUtil.internal();

  NetworkUtil.internal();

  factory NetworkUtil() => _instance;

  Dio dio = Dio();

  // for get respons from api //

  Future<Response> get(String url, {Map headers}) async {
    var response;
    try {
      dio.options.baseUrl = "https://taknikat.com/api/";
      response = await dio.get(url, options: Options(headers: headers));
    } on DioError catch (e) {
      if (e.response != null) {
        response = e.response;
        print("response: " + e.response.toString());
      } else {}
    }
    return response == null ? null : handleResponse(response);
  }

  // for post respons from api //

  Future<Response> post(String url,
      {Map headers, FormData body, encoding}) async {
    var response;
    dio.options.baseUrl = "https://taknikat.com/api/";
    try {
      response = await dio.post(url,
          data: body,
          options: Options(headers: headers, requestEncoder: encoding));
    } on DioError catch (e) {
      if (e.response != null) {
        response = e.response;
        print("response: " + e.response.toString());
      } else {}
    }
    return response == null ? null : handleResponse(response);
  }

  // to handle response //

  Response handleResponse(Response response) {
    final int statusCode = response.statusCode;
    print("response: " + response.toString());
    if (statusCode >= 200 && statusCode < 300) {
      return response;
    } else {
      return response;
    }
  }
}
