import 'package:flutter/material.dart';

class DrawerBody extends StatelessWidget {
   final IconData iconData;
 final String namefeld;
 final Color iconColor;
 final void Function()? ontap;
   DrawerBody({super.key, required this.iconData, required this.namefeld, required this.ontap, required this.iconColor});


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(iconData),
        SizedBox(
          width: 20,
        ),
        InkWell(
          onTap: ontap,
          child: Text("$namefeld"))
      ],
    );
  }
}
