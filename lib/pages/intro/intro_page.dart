import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final controller = PageController();
  var index = 0;

  @override
  void initState() {
    controller.addListener(() {
      // 2.34.round();
      index = (controller.page ?? 0).round();
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Image.asset(
          "assets/images/logo.png",
          height: 50,
        ),
        centerTitle: false,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: controller,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Text(
                      //   "${this.index}",
                      //   style: const TextStyle(fontSize: 24),
                      // ),
                      Expanded(
                        child: Text(
                          "intro${index + 1}".tr(),
                          textAlign: TextAlign.start,
                          style: const TextStyle(fontSize: 24),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Image.asset(
                          "assets/images/intro${index + 1}.png",
                          width: double.infinity,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      const Spacer(),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 10,
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                separatorBuilder: (_, i) => const SizedBox(width: 8),
                itemBuilder: (_, i) {
                  return Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: index == i ? Colors.blueAccent : Colors.grey,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 12),
            MaterialButton(
              onPressed: () {
                controller.animateToPage(
                  index + 1,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.linear,
                );
              },
              minWidth: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 16),
              color: Colors.blueAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                "continue".tr(),
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
