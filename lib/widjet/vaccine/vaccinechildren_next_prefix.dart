import 'package:flutter/material.dart';

class VaccinechildrenNextPrefix extends StatelessWidget {
  const VaccinechildrenNextPrefix({
    super.key,
    required this.nameVaccin,
    required this.centerVaccin,
    required this.dateVaccin,
  });

  final String nameVaccin;
  final String centerVaccin;
  final String dateVaccin;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.04,
        vertical: screenHeight * 0.01,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(screenHeight * 0.015),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Vaccine Name
            Row(
              children: [
                Icon(Icons.vaccines, color: Colors.teal, size: 22),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    nameVaccin,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: screenHeight * 0.02,
                      color: Colors.black87,
                      fontFamily: 'Cairo',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.012),

            // Vaccine Date
            Row(
              children: [
                Icon(Icons.date_range, color: Colors.blueGrey, size: 20),
                SizedBox(width: 8),
                Text(
                  dateVaccin,
                  style: TextStyle(
                    fontSize: screenHeight * 0.018,
                    color: Colors.black54,
                    fontFamily: 'Cairo',
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.008),

            // Vaccine Center
            Row(
              children: [
                Icon(Icons.location_on, color: Colors.deepOrange, size: 20),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    centerVaccin.isNotEmpty ? centerVaccin : "لم يتم التحديد",
                    style: TextStyle(
                      fontSize: screenHeight * 0.018,
                      color: Colors.black54,
                      fontFamily: 'Cairo',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
