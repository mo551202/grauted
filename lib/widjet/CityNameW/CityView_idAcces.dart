import 'package:aldana551/http_sub.dart';
import 'package:aldana551/main.dart';
import 'package:aldana551/screen/Centername.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CityviewIdacces extends StatelessWidget {
  CityviewIdacces({super.key, required this.name});
  final String name;
  respon ins = respon();

  // دالة للوصول إلى معلومات المدينة
  accessIdCity(String cityname, BuildContext context) async {
    try {
      var respons = await ins.postRequst(
        "http://$linkconact/cours1/AccesIdCity.php",
        {"name": cityname},
      );
      
      // تحقق من نجاح الاستجابة
      if (respons['s'] == "sucsses") {
        // حفظ ID المدينة
        sharedPreferences?.setString("idCity", respons['data'][0]['id'].toString());
        print("City ID: ${sharedPreferences?.getString("idCity")}");
        
        // الانتقال إلى الصفحة التالية بعد النجاح
        Get.to(() => CenterNamePage());
      } else {
        // إذا كانت الاستجابة غير ناجحة
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("لم يتم العثور على المدينة")),
        );
      }
    } catch (e) {
      print("حدث خطأ أثناء الاتصال: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("حدث خطأ أثناء الاتصال بالخادم")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.teal,
            child: Text(
              name[0],
              style: const TextStyle(color: Colors.white),
            ),
          ),
          title: Text(
            name,
            style: const TextStyle(
              fontFamily: 'Cairo',
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: const Icon(Icons.arrow_forward_ios_rounded,
              color: Colors.teal, size: 18),
          onTap: () {
            print("تم الضغط على المدينة: $name");
            accessIdCity(name, context); // إضافة context هنا
          },
        ),
      ),
    );
  }
}
