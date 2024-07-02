import 'package:dio/dio.dart';

import 'error_interceptor.dart';
import 'headers_interceptor.dart';
import 'net_url_constant.dart';

typedef SuccessCallBack = Function(String data);

typedef ErrorCallBack = Function(String errorMsg);

class HttpUtils {
  var successCode = 200;

  static final HttpUtils _instance = HttpUtils._internal();

  static Dio? _dio;

  Dio? get dio {
    return _dio;
  }

  static HttpUtils getInstance() {
    return _instance;
  }

  HttpUtils._internal() {
    if (_dio == null) {
      var baseOptions = BaseOptions(
        connectTimeout: const Duration(minutes: 3),
        receiveTimeout: const Duration(minutes: 3),
        baseUrl: AppUrlConstant.baseUrl,
      );
      _dio = Dio(baseOptions);
      _dio?.interceptors.add(HeadersInterceptor());
      _dio?.interceptors.add(ErrorInterceptor());
      _dio?.interceptors.add(LogInterceptor(
        requestBody: true,
        responseBody: true,
      ));
    }
  }

  void getRequestWithParams(
    String url,
    Map<String, dynamic> params,
    SuccessCallBack successCallBack,
    ErrorCallBack errorCallBack,
  ) async {
    try {
      var response = await dio?.get(url, queryParameters: params);
      var statusCode = response?.statusCode;
      var statusMessage = response?.statusMessage;
      if (statusCode != successCode) {
        errorCallBack(statusMessage!);
      } else {
        successCallBack(response.toString());
      }
    } catch (e) {
      errorCallBack(e.toString());
    }
  }

  void getRequestNotParams(
    String url,
    SuccessCallBack successCallBack,
    ErrorCallBack errorCallBack,
  ) async {
    try {
      var response = await dio?.get(url);
      var statusCode = response?.statusCode;
      var statusMessage = response?.statusMessage;
      if (statusCode != successCode) {
        errorCallBack(statusMessage!);
      } else {
        successCallBack(response.toString());
      }
    } catch (e) {
      errorCallBack(e.toString());
    }
  }
}
