import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aldana551/controloer/homecontroler.dart';
import 'package:aldana551/widjet/onbording/animated_sub.dart';
import 'package:aldana551/widjet/onbording/button_sub.dart';
import 'package:aldana551/widjet/onbording/pageview_sub.dart';

class Onbording extends StatelessWidget {
  const Onbording({super.key});

  @override
  Widget build(BuildContext context) {
    // نأخذ الـ Controller الموجود مسبقًا
    final Homecontroler controller = Get.find<Homecontroler>();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: const [
            Expanded(
              flex: 3,
              child: PageviewSub(),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  AnimatedSub(),
                  SizedBox(height: 60),
                  ButtonSub(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
