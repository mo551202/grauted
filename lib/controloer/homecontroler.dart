import 'package:aldana551/main.dart';
import 'package:aldana551/screen/login.dart';
import 'package:aldana551/widjet/onbording/pageview_sub.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homecontroler extends GetxController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  bool? loading;
  String? exp;

  int i = 0;
  late PageController pagec;
  PageviewSub n=PageviewSub();

  updated() {
    loading = true;
    update();
  }

  unupdated() {
    loading = false;
    update();
  }

  next() {
  i++;
  print(i);
  if (i > 2) {
    Get.delete<Homecontroler>(); // ← تنظيف الـ Controller
    Get.off(Login());
  } else {
    pageController.animateToPage(i, duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
 }
}


  onchaned(int index) {
    i = index;
    update();
  }

  loginbutton() {
    var f = formState.currentState;
    if (f!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void onInit() {
    pagec = PageController();
    super.onInit(); // مهم
  }

  @override
  void onClose() {
    pagec.dispose(); // تنظيف الذاكرة
    super.onClose();
  }
}
