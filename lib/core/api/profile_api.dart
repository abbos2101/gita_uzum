import 'package:dio/dio.dart';

import 'api_base.dart';

class ProfileApi {
  final ApiBase _base;

  ProfileApi(this._base);

  Future<Response> profile() async {
    final response = await _base.dio.get(
      "/profile",
      options: Options(headers: {"Authorization": "Bearer ${_base.token}"}),
    );
    return response;
  }
}
