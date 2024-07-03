import 'package:dio/dio.dart';

import '../ext/ext_common.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
    final code = response.data['code'];
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);
    switch (err.type) {
      case DioExceptionType.unknown:
        logD("unknown");
        break;
      case DioExceptionType.badResponse:
        logD("badResponse");
        break;
      case DioExceptionType.cancel:
        logD("cancel");
        break;
      case DioExceptionType.connectionTimeout:
        logD("connectionTimeout");
        break;
      case DioExceptionType.connectionError:
        logD("connectionError");
        break;
      case DioExceptionType.receiveTimeout:
        logD("receiveTimeout");
        break;
      case DioExceptionType.sendTimeout:
        logD("sendTimeout");
        break;
      case DioExceptionType.badCertificate:
        logD("badCertificate");
        break;
      default:
    }
  }
}
