import 'package:flutter/material.dart';

class Body_info extends StatelessWidget {
  const Body_info({
    super.key,
    required this.namevaccin,
    required this.lastDate,
    required this.nextDate,
  });

  final String namevaccin;
  final String lastDate;
  final String nextDate;

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.symmetric(vertical: h * 0.01, horizontal: w * 0.015),
      padding: EdgeInsets.all(h * 0.025),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 4),
          )
        ],
        border: Border.all(color: Colors.blueAccent.withOpacity(0.2), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// عنوان اللقاح
          Row(
            children: [
              const Icon(Icons.vaccines, size: 28, color: Color(0xFF4DB6AC)),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  namevaccin,
                  style: TextStyle(
                    fontSize: h * 0.025,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey[800],
                  ),
                ),
              ),
            ],
          ),

          const Divider(height: 25, thickness: 1, color: Color(0xFFE0E0E0)),

          /// تاريخ الجرعة الحالية
          Row(
            children: [
              const Icon(Icons.event_available, color: Colors.teal),
              const SizedBox(width: 8),
              Text(
                "الجرعة الأخيرة:",
                style:
                    TextStyle(fontSize: h * 0.02, fontWeight: FontWeight.w500),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: Text(
                  lastDate,
                  style: TextStyle(fontSize: h * 0.02, color: Colors.black87),
                ),
              )
            ],
          ),

          const SizedBox(height: 10),

          /// تاريخ الجرعة التالية
          Row(
            children: [
              const Icon(Icons.calendar_month, color: Colors.deepPurple),
              const SizedBox(width: 8),
              Text(
                "الجرعة القادمة:",
                style:
                    TextStyle(fontSize: h * 0.02, fontWeight: FontWeight.w500),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: Text(
                  nextDate,
                  style: TextStyle(fontSize: h * 0.02, color: Colors.black87),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
