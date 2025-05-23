import 'package:aldana551/http_sub.dart';
import 'package:aldana551/main.dart';
import 'package:aldana551/screen/vaccine.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListtileTappar extends StatelessWidget {
  ListtileTappar({super.key, required this.first, required this.last});
  final String first;
  final String last;
  respon ins = respon();
  
  accessIdChildren(String firstname, String lastname) async {
    var respons = await ins.postRequst(
        "http://$linkconact/cours1/AccesIdChildren.php",
        {"firstname": firstname, "lastname": lastname,"momid": sharedPreferences.get("id").toString()});

    if (respons['s'] == "sucsses") {
      sharedPreferences?.setString(
          "idChildren", respons['data'][0]['id'].toString());
      print(sharedPreferences.getString("idChildren"));
      Get.to(Test());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // حواف دائرية
      ),
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12), // إضافة المسافة بين العناصر
      elevation: 4, // الظل لجعلها تبدو أكثر عمقًا
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8), // إضافة padding للمحتوى
        title: Text(
          "الطفل",
          style: TextStyle(
            fontSize: 18, 
            fontWeight: FontWeight.bold, 
            color: Colors.blue[800], // تلوين العنوان
          ),
        ),
        subtitle: Text(
          "$first $last", // دمج الأسماء
          style: TextStyle(
            fontSize: 16, 
            fontWeight: FontWeight.bold, 
            color: Colors.black87, // تحديد اللون للنص
          ),
        ),
        leading: Icon(
          Icons.child_care_sharp,
          color: Colors.blue[800], // تغيير لون الأيقونة
        ),
        trailing: InkWell(
          onTap: () {
            accessIdChildren(first, last);
          },
          child: Container(
            width: 120, // تحديد العرض لتناسب النص
            padding: EdgeInsets.symmetric(vertical: 10), // إضافة padding داخل الزر
            decoration: BoxDecoration(
              color: Colors.blue[700], // تغيير اللون الخلفي
              borderRadius: BorderRadius.circular(8), // حواف دائرية للزر
              boxShadow: [ // إضافة ظل خفيف
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Center(
              child: Text(
                "اضغط هنا \nلمعرفة حالته",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white, // جعل النص أبيض
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}