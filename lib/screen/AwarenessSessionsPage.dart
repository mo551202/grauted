import 'package:aldana551/http_sub.dart';
import 'package:aldana551/main.dart';
import 'package:aldana551/widjet/AwarenessSessionsPage/BodyInfoAwareness.dart';

import 'package:flutter/material.dart';

class AwarenessSessionsPage extends StatelessWidget {
  respon ins = respon();

  Future<dynamic> getAwarenessSessions() async {
    var respons = await ins.postRequst(
      "http://$linkconact/cours1/AwarenessSessions.php",
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

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(screenHeight * 0.01),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "جلسات التوعية",
              style: TextStyle(
                fontSize: screenHeight * 0.03,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Expanded(
              child: FutureBuilder(
                future: getAwarenessSessions(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError ||
                      !snapshot.hasData ||
                      snapshot.data['data'].isEmpty) {
                    return const Center(
                      child: Text(
                        "لا توجد جلسات حالياً أو حدث خطأ",
                        style: TextStyle(color: Colors.red, fontSize: 16),
                      ),
                    );
                  }

                  return ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: snapshot.data['data'].length,
                    itemBuilder: (context, i) {
                      var item = snapshot.data['data'][i];
                      return BodyInfoAwareness(
                        title: item['title'],
                        date: item['date'],
                        location: item['location'],
                      );
                    },
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
