import 'package:dio/dio.dart';
import 'package:gita_uzum/core/hive/user_hive.dart';
import 'package:gita_uzum/di.dart';

class ApiBase {
  final UserHive _hive;
  final _dio = Dio(BaseOptions(
    baseUrl: "http://206.189.128.74/api",
    connectTimeout: 60000,
  ));

  ApiBase(this._hive) {
    _dio.interceptors.add(alice.getDioInterceptor());
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        print("-= onRequest =-\n${options.path}\n${options.headers}");
        return handler.next(options);
      },
      onResponse: (options, handler) {
        print("-= onResponse =-\n${options.statusCode}\n${options.data}");
        return handler.next(options);
      },
      onError: (options, handler) {
        print("-= onResponse =-\n${options.response?.statusCode}");
        return handler.next(options);
      },
    ));
  }

  Future<void> saveToken(String token) async => await _hive.saveToken(token);

  String get token => _hive.token;

  Dio get dio => _dio;
}

// extension MyBaseApi on ApiBase{
//
// }
