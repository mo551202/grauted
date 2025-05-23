import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aldana551/controloer/homecontroler.dart';

class AnimatedSub extends GetView<Homecontroler> {
  const AnimatedSub({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Homecontroler>(
      builder: (control) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          3,
          (index) => AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: const EdgeInsets.symmetric(horizontal: 7),
            height: 7,
            width: control.i == index ? 30 : 7,
            decoration: BoxDecoration(
              color: control.i == index
                  ? const Color.fromARGB(255, 74, 172, 236)
                  : const Color.fromARGB(255, 161, 228, 233),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}
