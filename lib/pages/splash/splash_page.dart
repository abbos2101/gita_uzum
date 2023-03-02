import 'package:flutter/material.dart';
import 'package:gita_uzum/pages/test/test_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  var code = "";

  onTap(int index) {}
  @override
  void initState() {
    nextPage();
    super.initState();
  }

  void nextPage() async {
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const TestPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
        "assets/images/splash.png",
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill,
      ),
    );
  }
}
