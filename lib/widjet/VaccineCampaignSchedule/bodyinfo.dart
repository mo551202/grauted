import 'package:flutter/material.dart';

class Bodyinfo extends StatelessWidget {
  const Bodyinfo(
      {super.key,
      required this.namevaccin,
      required this.datevaccin,
      required this.locationvaccin,
      required this.cityvaccin});
  final String namevaccin;
  final String datevaccin;
  final String locationvaccin;
  final String cityvaccin;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(bottom: screenHeight * 0.02),
      padding: EdgeInsets.all(screenHeight * 0.025),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [Colors.blue[100]!, Colors.blue[300]!],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // اسم اللقاح مع أيقونة
          Row(
            children: [
              Icon(
                Icons.medical_services,
                color: Colors.blueAccent,
                size: 28,
              ),
              SizedBox(width: screenWidth * 0.03),
              Expanded(
                child: Text(
                  'اسم اللقاح: $namevaccin',
                  style: TextStyle(
                    fontSize: screenHeight * 0.023,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[800],
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          Divider(
            color: Colors.blue[200]!,
            thickness: 1,
            height: screenHeight * 0.015,
          ),

          // التاريخ مع أيقونة
          Row(
            children: [
              Icon(
                Icons.calendar_today,
                color: Colors.orangeAccent,
                size: 24,
              ),
              SizedBox(width: screenWidth * 0.03),
              Text(
                'التاريخ: $datevaccin',
                style: TextStyle(
                  fontSize: screenHeight * 0.02,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.015),

          // المدينة مع أيقونة
          Row(
            children: [
              Icon(
                Icons.location_city,
                color: Colors.greenAccent,
                size: 24,
              ),
              SizedBox(width: screenWidth * 0.03),
              Text(
                'المدينة: $cityvaccin',
                style: TextStyle(
                  fontSize: screenHeight * 0.02,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.015),

          // المركز مع أيقونة
          Row(
            children: [
              Icon(
                Icons.place,
                color: Colors.purpleAccent,
                size: 24,
              ),
              SizedBox(width: screenWidth * 0.03),
              Text(
                'الموقع: $locationvaccin',
                style: TextStyle(
                  fontSize: screenHeight * 0.02,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.015),

          // فاصل بين المعلومات وزر "قراءة المزيد"
          Divider(
            color: Colors.blue[200]!,
            thickness: 1,
            height: screenHeight * 0.02,
          ),

          // زر قراءة المزيد
        ],
      ),
    );
  }
}
