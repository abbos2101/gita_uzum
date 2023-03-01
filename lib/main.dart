import 'package:flutter/material.dart';
import 'package:gita_uzum/core/common/themes.dart';
import 'package:gita_uzum/pages/test_page.dart';

import 'di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(const MyApp());
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
      home: const TestPage(),
    );
  }
}
