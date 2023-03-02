import 'package:dio/dio.dart';

extension MyExce on dynamic {
  String get message {
    if (this is Response) {
      final e = this as Response;
      if (e.statusCode == 300) {
        return "";
      }
    }
    return "";
  }
}
