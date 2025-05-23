import 'dart:math';
import 'package:aldana551/controloer/homecontroler.dart';
import 'package:aldana551/http_sub.dart';
import 'package:aldana551/main.dart';
import 'package:aldana551/screen/CitysName.dart';
import 'package:aldana551/screen/ContactUspage.dart';
import 'package:aldana551/screen/VaccineCampaignSchedule.dart';
import 'package:aldana551/screen/article_Familyplanning.dart';
import 'package:aldana551/screen/Reproductivehealth_article.dart';
import 'package:aldana551/screen/login.dart';
import 'package:aldana551/screen/vaccine.dart';
import 'package:aldana551/widjet/drawer_sub/drawer_body.dart';
import 'package:aldana551/widjet/login/textFeld_sum.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

class DrawerSub extends GetView<Homecontroler> {
  DrawerSub({super.key});

  respon ins = respon();

  drawerHead() async {
    var respons = await ins.postRequst(
      "http://$linkconact/cours1/DrawerHead.php",
      {"id": sharedPreferences.get("id")},
    );

    if (respons['s'] == "sucsses") {
      return respons;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header Section (Profile Picture + User Info)
        Container(
          margin: EdgeInsets.only(right: 10, top: 50),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: ClipOval(
                  child: Container(
                    color: const Color.fromARGB(255, 241, 241, 241),
                    height: 50,
                    width: 50,
                    child: Icon(Icons.person_outline_outlined,size: 42,),
                  )
                ),
              ),
              SizedBox(height: 5), // زيادة المسافة بين الصورة والنص
              FutureBuilder(
                future: drawerHead(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            snapshot.data['data'][0]['name'],
                            style: TextStyle(
                              fontSize: 18, // زيادة حجم الخط
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF0099FF), // اللون الأزرق
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            "الرقم الوطني : ${snapshot.data['data'][0]['num']}",
                            style: TextStyle(fontSize: 14, color: Colors.black54),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    );
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  return Center(
                    child: Text("Loading ....."),
                  );
                },
              ),
            ],
          ),
        ),
        SizedBox(height: 15),
        Divider(
          height: 2,
          thickness: 1,
          color: Color(0xFFB0BEC5), // تغيير اللون ليكون حيادي
        ),
        // Menu Section (Navigation Items)
        Container(
          margin: EdgeInsets.only(right: 10, top: 30),
          child: Column(
            children: [
              // Reproductive Health Articles
              DrawerBody(
                ontap: () {
                  Get.offAll(ReproductivehealthArticle());
                  },
                iconData: Icons.safety_check,
                namefeld: "مقالات عن الصحة الانجابية",
                iconColor: Color(0xFF26C6DA), // اللون الأخضر الفاتح للأيقونة
              ),
              SizedBox(height: 30),
              // Family Planning Articles
              DrawerBody(
                ontap: () {
                  Get.to(FamilyplanningArticle());
                },
                iconData: Icons.article,
                namefeld: "مقالات عن تنظيم الاسرة",
                iconColor: Color(0xFF81C784), // لون أخضر مختلف
              ),
              
              // Vaccination Schedule
              
              SizedBox(height: 30),
              // Vaccination Centers
              DrawerBody(
                ontap: () {
                  Get.to(Citysname());
                },
                iconData: Icons.location_city,
                namefeld: "مراكز اللقاح",
                iconColor: Color(0xFF4CAF50), // لون أخضر
              ),
              SizedBox(height: 30),
              // Contact Us
              DrawerBody(
                ontap: () {
                  Get.off(ContactUsPage());
                },
                iconData: Icons.call,
                namefeld: "اتصل بنا",
                iconColor: Color(0xFF2196F3), // لون أزرق فاتح
              ),
              SizedBox(height: 30),
              // Logout
              Row(
                children: [
                  Icon(Icons.exit_to_app, color: Colors.red), // أيقونة الخروج باللون الأحمر
                  SizedBox(width: 15),
                  InkWell(
                    onTap: () {
                      sharedPreferences?.clear();
                      Get.offAll(Login());
                    },
                    child: Text(
                      "تسجيل خروج",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.red, // اللون الأحمر لتحديد أهمية الزر
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}