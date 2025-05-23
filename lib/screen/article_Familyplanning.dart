import 'package:aldana551/http_sub.dart';
import 'package:aldana551/main.dart';
import 'package:aldana551/screen/Home.dart';
import 'package:aldana551/widjet/FamilyplanningArticle/bodyarticle.dart';
import 'package:aldana551/widjet/Reproductivehealth_article/bodyArticle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FamilyplanningArticle extends StatefulWidget {
  const FamilyplanningArticle({super.key});

  @override
  State<FamilyplanningArticle> createState() =>
      _ReproductivehealthArticleState();
}

class _ReproductivehealthArticleState extends State<FamilyplanningArticle> {
  respon ins = respon();

  Future<dynamic> FamilyplanningArticle() async {
    var respons = await ins.postRequst(
      "http://$linkconact/cours1/FamilyplanningArticle.php",
      {"id": sharedPreferences.get("id")},
    );

    if (respons['s'] == "sucsses") {
      sharedPreferences.setString("idarticlePlanning", respons['data'][0]['id'].toString());
      return respons;
    } else {
      throw Exception("فشل في جلب البيانات");
    }
  }

  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF2F6FF),
        appBar: AppBar(
          backgroundColor: const Color(0xFF81D4FA),
          title: const Text(
            "تنظيم الأسرة",
            style: TextStyle(fontFamily: 'Cairo', fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Get.off(Home());
            },
          ),
        ),
        body: FutureBuilder(
          future: FamilyplanningArticle(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return const Center(
                child: Text(
                  "حدث خطأ أثناء تحميل البيانات",
                  style: TextStyle(color: Colors.red, fontSize: 16),
                ),
              );
            }

            if (snapshot.hasData) {
              if (snapshot.data['data'].isEmpty) {
                return const Center(
                  child: Text(
                    "لا توجد مقالات حاليًا",
                    style: TextStyle(fontSize: 18, color: Colors.black54),
                  ),
                );
              }

              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: snapshot.data['data'].length,
                itemBuilder: (context, i) {
                  return Column(
                    children: [
                     bodyArticleFamilyplanningArticle(
                      namearticle: snapshot.data['data'][i]['namearticle'],
                      textarticle: snapshot.data['data'][i]['textarticle'],
                      datearticle: snapshot.data['data'][i]['timearticle']),
                      
                    ],
                  );
                },
              );
            }

            return const Center(
              child: Text(
                "حدث خطأ أثناء تحميل البيانات",
                style: TextStyle(color: Colors.red, fontSize: 16),
              ),
            );;
          },
        ),
      ),
    );
  }
}
