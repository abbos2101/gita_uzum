import 'package:dio/dio.dart';
import 'package:gita_uzum/core/models/token_model.dart';

import 'api_base.dart';

class AuthApi {
  final ApiBase _base;

  AuthApi(this._base);

  Future<TokenModel> signUp({
    required String firstName,
    required String lastName,
    required String phone,
    required String password,
  }) async {
    final response = await _base.dio.post(
      "/auth/sign-up",
      data: {
        "first_name": firstName,
        "last_name": lastName,
        "phone_number": phone,
        "password": password,
      },
    );
    return TokenModel.fromJson(response.data["token"]);
  }

  Future<void> signIn({
    required String phone,
    required String password,
  }) async {
    final response = await _base.dio.post(
      "/auth/sign-in",
      data: {"phone_number": phone, "password": password},
    );
    await _base.saveToken(response.data["access_token"]);
  }

  Future<Response> signUpVerify({
    required String token,
    required String code,
  }) async {
    final response = await _base.dio.post(
      "/auth/sign-up/verify",
      data: {"token": token, "code": code},
    );
    return response;
  }

  Future<Response> signUpResend({
    required String token,
  }) async {
    final response = await _base.dio.post(
      "/auth/sign-up/resend",
      data: {"token": token},
    );
    return response;
  }
}
