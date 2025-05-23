import 'package:aldana551/controloer/homecontroler.dart';
import 'package:aldana551/screen/Home.dart';

import 'package:aldana551/screen/login.dart';
import 'package:aldana551/screen/onbording.dart';
import 'package:aldana551/screen/FamilyContact.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences sharedPreferences;
late Color primarycolor;
late Color secondrycolor;
late String linkconact;
late Homecontroler controller;
 late  PageController pageController;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  primarycolor = Color(0xffF45B69);
  secondrycolor = Color.fromARGB(255, 66, 245, 105);
  linkconact = "192.168.1.17";
controller=Get.put(Homecontroler(), permanent: true);
  pageController=PageController();
  runApp(const Home1());
}

class Home1 extends StatefulWidget {
  const Home1({super.key});

  @override
  State<Home1> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Home1> {
  GlobalKey<ScaffoldState> d = new GlobalKey<ScaffoldState>();
  var con;
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: Get.deviceLocale,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'cairo'),
      home: Onbording(),
      routes: {
        "/login": (context) => Login(),
        "/home": (context) => Home(),
        "/loginpage": (context) => LoginPage(),
        "/onbord": (context) => Onbording(),
      },
    );
  }
}
