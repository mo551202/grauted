import 'package:flutter/material.dart';

class TextloginSub extends StatelessWidget {
  const TextloginSub({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      
      child: Column(
        children: [
          Text(
                  "مرحبا بك في تطبيق اللقاح الوطني",
                  textAlign: TextAlign.center,
                  style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                ),
                SizedBox(height: 21,),
                 Text(
                  
                  "مرحبًا بك في تطبيقنا، قم بتسجيل الدخول \nباستخدام بطاقة الهوية الوطنية الخاصة بك",
                  textAlign: TextAlign.center,
                  style:   TextStyle(fontSize: 12.5,height: 2.5),
                   
                ),
        ],
      ),
    );
  }
}