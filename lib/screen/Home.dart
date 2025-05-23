import 'package:aldana551/main.dart';
import 'package:aldana551/screen/AwarenessSessionsPage.dart';
import 'package:aldana551/screen/MotherVaccineSchedule.dart';
import 'package:aldana551/screen/VaccineCampaignSchedule.dart';
import 'package:aldana551/screen/login.dart';
import 'package:aldana551/widjet/Home/Tabparveiw_sub.dart';
import 'package:aldana551/widjet/Home/drawer_sub.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    double screenhieght = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: Drawer(
        backgroundColor: const Color(0xFFE1F5FE), // نفس اللون الأزرق الفاتح
        width: 260,
        child: DrawerSub(),
      ),
      appBar: AppBar(
        toolbarHeight: screenhieght * 0.07,
        elevation: 0.0,
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
          "الصفحة  الرئيسية",
          style: TextStyle(
            fontFamily: 'Cairo',
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          TabparveiwSub(),
          AwarenessSessionsPage(),
          Mothervaccineschedule(),
          VaccineCampaignSchedule(),
        ],
      ),
      bottomNavigationBar: Material(
        color: Color(0xFF4CAF50), // اللون الأخضر الهادئ في الشريط السفلي
        child: TabBar(
          controller: tabController,
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(width: 3.0, color: Color(0xFFb2dfdb)),
            insets: EdgeInsets.symmetric(horizontal: 1, vertical: 0.5),
          ),
          indicatorWeight: 2,
          labelColor: Colors.white,
          unselectedLabelColor:
              Color(0xFF004f7c), // اللون الداكن للأزرار غير المختارة
          unselectedLabelStyle: TextStyle(fontSize: 10),
          labelStyle: TextStyle(fontSize: 12),
          tabs: [
            Tab(
              child: Text(
                "الأطفال",
                style: TextStyle(fontFamily: 'cairo'),
              ),
              icon: Icon(Icons.child_care),
            ),
            Tab(
              icon: Icon(Icons.group_work_outlined),
              child: Text(
                "جلسات التوعية",
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: 'cairo'),
              ),
            ),
            Tab(
              icon: Icon(Icons.pregnant_woman_outlined),
              child: FittedBox(
                child: Text(
                  "الأمهات",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: 'cairo'),
                ),
              ),
            ),
            Tab(
              icon: Icon(Icons.timelapse),
              child: FittedBox(
                child: Text(
                  "مواعيد حملات \nاللقاح",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: 'cairo'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
