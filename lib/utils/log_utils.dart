import 'package:flutter/foundation.dart';

class LogUtils {
  static void log(String message) {
    if (kDebugMode) {
      print(message);
    }
  }
}
