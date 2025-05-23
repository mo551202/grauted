import 'package:aldana551/http_sub.dart';
import 'package:aldana551/main.dart';
import 'package:aldana551/screen/usersContact.dart';
import 'package:aldana551/widjet/FamilyContact/textFiledFamily.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController hintController = TextEditingController();
  final TextEditingController labelController = TextEditingController();

  LoginPage({super.key});
   respon ins = respon();
   usersContact ins1 = usersContact();
  viewFmilycontact(BuildContext context) async {
    var respons = await ins.postRequst(
        "http://$linkconact/cours1/AddFamilyContact.php",
        {
          
          "name": hintController.text,
          "num": labelController.text,
        
        
        });

    if (respons['s'] == "sucsses") {
      ins1.getIdforMothesWithSignin(labelController.text);
            Get.to(usersContact());

    }
    else{
      showDialog(context:context, builder: (_)=>AlertDialog(title: Text("عذرا الرقم الوطني موجود مسبقا "),));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                 "معلومات الام أو المسؤول",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[800],
                  ),
                ),
                const SizedBox(height: 40),
               Textfiledsubfamily(hintt: "ادخل اسم الام الكامل",labeel: "اسم الام ",ff: hintController,),
                const SizedBox(height: 20),
               Textfiledsubfamily(hintt: "ادخل الرقم الوطني",labeel: "الرقم الوطني",ff: labelController,),

                const SizedBox(height: 20),
               

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                     viewFmilycontact(context);
                
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[800],
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      "التالي",
                      style: TextStyle(fontSize: 18,color: Colors.black),
                    ),
                  ),
                ),
                TextButton(onPressed: (){Get.back();}, child: Text("GO bACK "))
              ],
            ),
          ),
        ),
      ),
    );
  }
}