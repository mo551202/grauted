import 'package:aldana551/http_sub.dart';
import 'package:aldana551/main.dart';
import 'package:aldana551/screen/login.dart';
import 'package:aldana551/screen/vaccine.dart';
import 'package:aldana551/widjet/Home/listtile_tappar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabparveiwSub extends StatelessWidget {
   TabparveiwSub({super.key});
   respon ins = respon();
 viewChilren() async {
    var respons = await ins.postRequst(
        "http://$linkconact/cours1/MotherChildren.php",
        {"id": sharedPreferences.get("id")});

    if (respons['s'] == "sucsses") { 
      return respons;
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
     FutureBuilder(
                future: viewChilren(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                   return ListView.builder(
                    itemCount: snapshot.data['data'].length,
shrinkWrap: true,
physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context,i){
                    
     return ListtileTappar(first: "${snapshot.data['data'][i]['firstname']}",last:"${snapshot.data['data'][i]['lastname']}" ,);
                   });
                  }
                  
     
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: Text("Loading ....."),
                    );
                  }
                  return Center(
                    heightFactor: 21,
                    child: Text("لايوجد أطفال حاليا أو يوجد خطأ في الاتصال "),
                  );
                }),
       
      ],
    )
    
;
  }
}