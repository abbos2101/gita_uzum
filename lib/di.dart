import 'package:alice/alice.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:gita_uzum/core/api/api.dart';
import 'package:gita_uzum/core/hive/hive_base.dart';
import 'package:gita_uzum/core/hive/user_hive.dart';

final alice = Alice(
  showNotification: kDebugMode,
  showInspectorOnShake: true,
  showShareButton: true,
);
final di = GetIt.instance;

Future<void> setup() async {
  di.registerSingleton(HiveBase());
  await di.get<HiveBase>().init();
  di.registerFactory(() => UserHive(di.get<HiveBase>().userBox));

  di.registerSingleton(ApiBase(di.get()));
  di.registerFactory(() => AuthApi(di.get()));
  di.registerFactory(() => CardApi(di.get()));
  di.registerFactory(() => HistoryApi(di.get()));
  di.registerFactory(() => PaymentApi(di.get()));
  di.registerFactory(() => ProfileApi(di.get()));
  di.registerFactory(() => TransferApi(di.get()));
}
