import 'package:aldana551/additional/alert.dart';
import 'package:aldana551/controloer/homecontroler.dart';
import 'package:aldana551/http_sub.dart';
import 'package:aldana551/main.dart';
import 'package:aldana551/screen/Home.dart';
import 'package:aldana551/screen/vaccine.dart';
import 'package:aldana551/widjet/login/textFeld_sum.dart';
import 'package:aldana551/widjet/login/textLogin_sub.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Homecontroler controller = Homecontroler();
  TextEditingController ft = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Color(0xFFE1F5FE), // أزرق فاتح مريح للعين
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xFF81D4FA), // أزرق سماوي ناعم
                Color(0xFF4CAF50), // أخضر هادئ
              ],
            ),
          ),
        ),
        title: Text(
          "تسجيل الدخول",
          style: TextStyle(
            fontFamily: 'Cairo',
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: GetBuilder<Homecontroler>(
        builder: (controller) => WillPopScope(
          onWillPop: alertexit,
          child: controller.loading == true
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "انتظر قليلاً من فضلك",
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF4CAF50), // أخضر هادئ للرسائل
                      ),
                    ),
                    SizedBox(height: 12),
                    Center(
                        child: CircularProgressIndicator(
                            backgroundColor: Color(0xFF4CAF50))),
                  ],
                )
              : Stack(
                  children: [
                    Positioned(
                      top: screenwidth * 0.09,
                      left: screenheight * 0.1,
                      right: screenheight * 0.1,
                      child: Image.asset(
                        "images/vaccine.png",
                        width: 350,
                        height: 100,
                      ),
                    ),
                    Positioned(
                      top: screenwidth * 0.45,
                      left: screenwidth * 0.06,
                      right: screenwidth * 0.06,
                      child: SingleChildScrollView(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 10,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: screenheight * 0.02
                            ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(height: screenwidth * 0.02),
                              const TextloginSub(),
                              SizedBox(height: screenwidth * 0.1),
                              TextfeldSum(ff: ft),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}