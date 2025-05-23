import 'package:aldana551/controloer/homecontroler.dart';
import 'package:aldana551/controloer/valid.dart';
import 'package:aldana551/http_sub.dart';
import 'package:aldana551/main.dart';
import 'package:aldana551/screen/ContactUspage.dart';
import 'package:aldana551/screen/FamilyContact.dart';
import 'package:aldana551/screen/Home.dart';
import 'package:aldana551/screen/LoginContactUspage.dart';
import 'package:aldana551/screen/login.dart';
import 'package:aldana551/widjet/Home/drawer_sub.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextfeldSum extends GetView<Homecontroler> {
  final TextEditingController ff;

  TextfeldSum({super.key, required this.ff});

  respon ins = respon();
  late String exp = "";
  bool loading = false;

  // دالة لإظهار Dialog نجاح تسجيل الدخول باستخدام GetX
  void loginSuccess() {
    Get.defaultDialog(
      title: "تم تسجيل الدخول بنجاح",
      middleText: "مرحباً بك في التطبيق",
      backgroundColor: Color(0xFF00c6ff),
      titleStyle: TextStyle(color: Colors.white),
      middleTextStyle: TextStyle(color: Colors.white),
      radius: 10,
     
    );
  }

  // دالة لإظهار Dialog فشل تسجيل الدخول باستخدام GetX
  void loginFailure() {
    Get.defaultDialog(
      title: "فشل في تسجيل الدخول",
      middleText: "الرقم الذي أدخلته غير موجود أو غير صحيح.",
      backgroundColor: Colors.redAccent,
      titleStyle: TextStyle(color: Colors.white),
      middleTextStyle: TextStyle(color: Colors.white),
      radius: 10,
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: Text(
            "موافق",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }

  loggin(BuildContext context) async {
    controller.updated();
    late String s;
    await Future.delayed(Duration(seconds: 3));
    var respons = await ins.postRequst("http://$linkconact/cours1/login.php", {"num": ff.text});
    controller.unupdated();

    if (respons['s'] == "sucsses") {
      sharedPreferences?.setString("id", respons['data'][0]['id'].toString());
      sharedPreferences?.setString("name", respons['data'][0]['name']);

      // إظهار رسالة نجاح تسجيل الدخول
      

      if (respons['data'][0]['isAdmin'].toString() == "1") {
        Get.to(LoginPage());
      } else {
        Get.off(Home());
      }
    } else {
      // إظهار رسالة فشل تسجيل الدخول
      loginFailure();
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        // TextField for National Number
        Form(
          key: controller.formState,
          child: TextFormField(
            controller: ff,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            validator: (val) {
              var r = valed(val!, 5, 15, "phoneNumber");
              return r;
            },
            decoration: InputDecoration(
              hintText: "أدخل الرقم الوطني",
              hintStyle: TextStyle(fontSize: 13),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
              suffixIcon: Icon(Icons.perm_identity_outlined, color: Color(0xFF0099ff)),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              label: Container(
                padding: EdgeInsets.all(10),
                child: Text("الرقم الوطني", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF0099ff))),
                ),
            ),
          ),
        ),
        
        // Login Button
        Container(
          width: screenWidth * 0.9,
          margin: EdgeInsets.only(top: screenWidth * 0.06),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 157, 227, 245),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0, 4),
                blurRadius: 6,
              ),
            ],
          ),
          child: TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Color(0xFF0099ff), // تغيير اللون ليكون متناسق مع التصميم
            ),
            onPressed: () async {
              if (controller.loginbutton()) {
                await loggin(context);
              }
            },
            child: Text(
              "تسجيل الدخول",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Color(0xFF0099ff),
              ),
            ),
          ),
        ),
        
        // Contact Us Row
        Container(
          margin: EdgeInsets.only(top: screenHeight * 0.04, right: screenHeight * 0.078),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("إذا واجهتك أي مشكلة !!", style: TextStyle(fontSize: 12, color: Colors.black54)),
              TextButton(
                onPressed: () {
                  Get.offAll(Logincontactuspage());
                },
                child: Text("اتصل بنا", style: TextStyle(color: Colors.blueAccent)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}