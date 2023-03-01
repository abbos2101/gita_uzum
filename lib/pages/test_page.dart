import 'package:flutter/material.dart';
import 'package:gita_uzum/core/api/api.dart';
import 'package:gita_uzum/di.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

enum Status { initial, loading, fail, success }

class _TestPageState extends State<TestPage> {
  final authApi = di.get<AuthApi>();
  final profileApi = di.get<ProfileApi>();
  var data = "";
  var status = Status.initial;

  void onTap() async {
    status = Status.loading;
    setState(() {});
    try {
      // await authApi.signIn(
      //   phone: "+998330250427",
      //   password: "qwerty12345A",
      // );
      await profileApi.profile();
      status = Status.success;
      setState(() {});
    } catch (e) {
      status = Status.fail;
      data = "$e";
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Builder(
        builder: (context) {
          switch (status) {
            case Status.initial:
              return const Center(
                child: Text(
                  "INITIAL",
                  style: TextStyle(fontSize: 32),
                ),
              );
            case Status.loading:
              return const Center(child: CircularProgressIndicator());
            case Status.fail:
              return Center(
                child: Text(
                  data,
                  style: const TextStyle(fontSize: 32),
                ),
              );
            case Status.success:
              return Center(
                child: Text(
                  data,
                  style: const TextStyle(fontSize: 32),
                ),
              );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: onTap),
    );
  }
}
