import 'package:dio/dio.dart';

import '../utils/log_utils.dart';

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
        LogUtils.log("unknown");
        break;
      case DioExceptionType.badResponse:
        LogUtils.log("badResponse");
        break;
      case DioExceptionType.cancel:
        LogUtils.log("cancel");
        break;
      case DioExceptionType.connectionTimeout:
        LogUtils.log("connectionTimeout");
        break;
      case DioExceptionType.connectionError:
        LogUtils.log("connectionError");
        break;
      case DioExceptionType.receiveTimeout:
        LogUtils.log("receiveTimeout");
        break;
      case DioExceptionType.sendTimeout:
        LogUtils.log("sendTimeout");
        break;
      case DioExceptionType.badCertificate:
        LogUtils.log("badCertificate");
        break;
      default:
    }
  }
}
