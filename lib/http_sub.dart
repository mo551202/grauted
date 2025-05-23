import 'package:aldana551/screen/Home.dart';
import 'package:get/get.dart';
import 'package:http/http.dart ' as http;
import 'dart:convert';

class respon {
  postRequst(String url, Map data) async {
    try {
      
      var respons = await http.post(Uri.parse(url), body: data);
      if (respons.statusCode == 200) {
        
        var respnsbody = jsonDecode(respons.body);
        return respnsbody;
      }
      else{
Get.to(Home());

      }
    } catch (e) {}
    
  }

  getRequst(String url) async {
    try {
      var respons = await http.get(Uri.parse(url));
      if (respons.statusCode == 200) {
        var respnsbody = jsonDecode(respons.body);
        return respnsbody;
      }
    } catch (e) {}
}
}