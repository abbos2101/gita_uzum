import 'package:hive/hive.dart';

class UserHive {
  final Box _box;

  UserHive(this._box);

  String get token => _box.get("token");

  Future<void> saveToken(String token) async => await _box.put("token", token);
}
