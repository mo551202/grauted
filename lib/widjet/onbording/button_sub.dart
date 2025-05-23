import 'package:aldana551/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aldana551/controloer/homecontroler.dart';
import 'package:aldana551/screen/login.dart';

class ButtonSub extends StatelessWidget {
  const ButtonSub({super.key});

  @override
  Widget build(BuildContext context) {
   
    double screenHeight = MediaQuery.of(context).size.height;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // زر تخطي
        Container(
          width: 150,
          height: screenHeight * 0.07,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 206, 202, 202),
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextButton(
            onPressed: () {
              Get.offAll(const Login());
            },
            child: const Text(
              "تخطي",
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
          ),
        ),
        const SizedBox(width: 20),

        // زر التالي
        Container(
          width: 150,
          height: screenHeight * 0.07,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 166, 51, 233),
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextButton(
            onPressed: () {
              controller.next();
            },
            child: const Text(
              "التالي",
              style: TextStyle(
                color: Color.fromARGB(255, 241, 236, 236),
                fontSize: 18,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
