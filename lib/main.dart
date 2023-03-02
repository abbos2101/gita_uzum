import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gita_uzum/core/common/themes.dart';
import 'package:gita_uzum/pages/intro/intro_page.dart';
import 'package:gita_uzum/pages/pagination/pagination_page.dart';
import 'package:gita_uzum/pages/splash/splash_page.dart';

import 'di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('uz'), Locale('ru')],
      path: 'assets/tr',
      fallbackLocale: const Locale('uz'),
      startLocale: const Locale('uz'),
      useOnlyLangCode: true,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      navigatorKey: alice.getNavigatorKey(),
      theme: MyThemes.light(),
      darkTheme: MyThemes.dark(),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: const PaginationPage(),
    );
  }
}
