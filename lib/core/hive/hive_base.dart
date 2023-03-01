import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveBase {
  late final Box _userBox;

  Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    Hive.init("${dir.path}hive");
    _userBox = await Hive.openBox("userBox");
  }

  Box get userBox => _userBox;
}
