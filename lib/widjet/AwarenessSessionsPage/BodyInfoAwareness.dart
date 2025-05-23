import 'package:flutter/material.dart';

class BodyInfoAwareness extends StatelessWidget {
  final String title;
  final String date;
  final String location;

  const BodyInfoAwareness({
    super.key,
    required this.title,
    required this.date,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.only(bottom: h * 0.02),
      padding: EdgeInsets.all(h * 0.025),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: LinearGradient(
          colors: [Colors.teal[100]!, Colors.teal[300]!],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // عنوان الجلسة
          Row(
            children: [
              Icon(Icons.record_voice_over, color: Colors.teal[800], size: h * 0.03),
              SizedBox(width: w * 0.03),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: h * 0.022,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal[900],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: h * 0.015),
          Row(
            children: [
              Icon(Icons.calendar_today, color: Colors.blueAccent, size: h * 0.025),
              SizedBox(width: w * 0.02),
              Text(
                'التاريخ: $date',
                style: TextStyle(fontSize: h * 0.018),
              ),
            ],
          ),
          SizedBox(height: h * 0.01),
          Row(
            children: [
              Icon(Icons.location_on, color: Colors.redAccent, size: h * 0.025),
              SizedBox(width: w * 0.02),
              Text(
                'المكان: $location',
                style: TextStyle(fontSize: h * 0.018),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
