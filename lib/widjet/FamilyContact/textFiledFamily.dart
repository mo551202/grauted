import 'package:aldana551/controloer/valid.dart';
import 'package:aldana551/http_sub.dart';
import 'package:aldana551/main.dart';
import 'package:flutter/material.dart';

class Textfiledsubfamily extends StatelessWidget {
  
  Textfiledsubfamily({super.key, required this.hintt, required this.labeel,required this.ff});
  final String hintt;
  final String labeel;
  final TextEditingController ff ;
 

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: ff,
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      validator: (val) {
        var r = valed(val!, 8, 15, "phoneNumber");
        return r;
      },
      decoration: InputDecoration(
          hintText: hintt,
          hintStyle: TextStyle(fontSize: 13),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
          suffixIcon: Icon(Icons.perm_identity_outlined),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          label: Container(
            padding: EdgeInsets.all(10),
            child: Text(labeel),
          )),
    );
  }
}
