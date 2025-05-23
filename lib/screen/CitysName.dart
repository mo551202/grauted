import 'package:aldana551/http_sub.dart';
import 'package:aldana551/main.dart';
import 'package:aldana551/widjet/CityNameW/CityView_idAcces.dart';
import 'package:flutter/material.dart';

class Citysname extends StatelessWidget {
  Citysname({super.key});

  respon ins = respon();

  Future<dynamic> City() async {
    var respons = await ins.postRequst(
        "http://$linkconact/cours1/CityName.php",
        {"id": sharedPreferences.get("id")});

    if (respons['s'] == "sucsses") {
      return respons;
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenhieght = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Color(0xFFF2F2F2),
        appBar: AppBar(
          toolbarHeight: screenhieght * 0.07,
          elevation: 0.0,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xFF81D4FA),
                  Color(0xFF4CAF50),
                ],
              ),
            ),
          ),
          title: const Text(
            "أسماء المدن",
            style: TextStyle(
              fontFamily: 'Cairo',
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          centerTitle: true,
        ),
        body: FutureBuilder(
          future: City(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasData) {
              if (snapshot.data['data'].isEmpty) {
                return const Center(
                  child: Text(
                    "لا توجد مدن حاليًا",
                    style: TextStyle(fontSize: 18, color: Colors.black54),
                  ),
                );
              }

              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: snapshot.data['data'].length,
                itemBuilder: (context, i) {
                  return CityviewIdacces(name:snapshot.data['data'][i]['name'] );
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
    );
  }
}
