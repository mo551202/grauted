import 'package:aldana551/http_sub.dart';
import 'package:aldana551/main.dart';
import 'package:aldana551/widjet/FamilyContact/textFiledFamily.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class usersContact extends StatelessWidget {
  final TextEditingController hintController = TextEditingController();
  final TextEditingController labelController = TextEditingController();

  usersContact({super.key});
 
  respon ins = respon();
  getIdforMothesWithSignin(String natinalId) async {
    var respons = await ins
        .postRequst("http://192.168.43.4/cours1/getIdforMothesWithSignin.php", {
      "num": natinalId,
    });

    if (respons['s'] == "sucsses") {
      sharedPreferences.setString("idcontactUser", respons['data'][0]['id'].toString());
      print(respons['data'][0]['id'].toString());
    } else {}
  }

  releshinChildrenWithMom(BuildContext context) async {
    var respons = await ins.postRequst(
        "http://$linkconact/cours1/AddUsersContact.php",
        {
          
          "lastname": labelController.text,
          "firstname":hintController.text,
          "momid":sharedPreferences.get("idcontactUser")
        
        });

    if (respons['s'] == "sucsses") {
                 showDialog(context:context, builder: (_)=>AlertDialog(title: Text("hi"),));


    }
    else{
      showDialog(context:context, builder: (_)=>AlertDialog(title: Text("عذرا الطفل  مدخل مسبقا "),));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 30),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "معلومات الطفل ",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[800],
                ),
              ),
              const SizedBox(height: 40),
              Textfiledsubfamily(
                hintt: "",
                labeel: "first name ",
                ff: hintController,
              ),
              const SizedBox(height: 20),
              Textfiledsubfamily(
                hintt: "",
                labeel: "last name ",
                ff: labelController,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                   releshinChildrenWithMom(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[800],
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "next",
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ),
              ),
              TextButton(onPressed: (){Get.back();}, child: Text("GO bACK "))
            ],
          ),
        ),
      ),
    );
  }
}
