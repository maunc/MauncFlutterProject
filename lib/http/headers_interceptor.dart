

import 'package:dio/dio.dart';

class HeadersInterceptor extends Interceptor {

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    super.onRequest(options, handler);
    options.headers["token"] = "";
  }

}