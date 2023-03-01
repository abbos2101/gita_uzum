class TokenModel {
  TokenModel._({
    required this.token,
    required this.code,
  });

  final String token; //null bo'lishi mumkin
  final String code;

  factory TokenModel.fromJson(Map<String, dynamic> json) => TokenModel._(
        token: json["token"] ?? "",
        code: json["code"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "code": code,
      };
}
