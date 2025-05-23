import 'package:aldana551/http_sub.dart';
import 'package:aldana551/main.dart';
import 'package:aldana551/widjet/VaccineCampaignSchedule/bodyinfo.dart';
import 'package:flutter/material.dart';

class VaccineCampaignSchedule extends StatelessWidget {
  // قائمة لتخزين بيانات حملات اللقاح
  respon ins = respon();
  Future<dynamic> FamilyplanningArticle() async {
    var respons = await ins.postRequst(
      "http://$linkconact/cours1/VaccineCampaignSchedule.php",
      {"id": sharedPreferences.get("id")},
    );

    if (respons['s'] == "sucsses") {
      return respons;
    } else {
      throw Exception("فشل في جلب البيانات");
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(screenHeight * 0.009),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // عنوان النص في أعلى الصفحة
            Text(
              "جدول مواعيد حملات اللقاح",
              style: TextStyle(
                fontSize: screenHeight * 0.03,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            
            // تحميل البيانات باستخدام FutureBuilder
            Expanded(
              child: FutureBuilder(
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
                          "لا توجد مواعيد حالياً",
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
                            Bodyinfo(
                              namevaccin: snapshot.data['data'][i]['name'],
                              datevaccin: snapshot.data['data'][i]['datevaccin'],
                              locationvaccin: snapshot.data['data'][i]['location'],
                              cityvaccin: snapshot.data['data'][i]['city']
                            ),
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
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
