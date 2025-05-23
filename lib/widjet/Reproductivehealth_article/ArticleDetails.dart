import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArticleDetails extends StatelessWidget {
  final String title;
  final String content;
  final String date;

  const ArticleDetails({
    super.key,
    required this.title,
    required this.content,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFF2F6FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF81D4FA),
        title: const Text(
          "تفاصيل المقالة",
          style: TextStyle(fontFamily: 'Cairo', fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // عنوان المقالة
              Text(
                title,
                style: TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: screenHeight * 0.028,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 10),

              // التاريخ + زر المشاركة
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    date,
                    style: TextStyle(color: Colors.black54, fontSize: screenHeight * 0.018),
                  ),
                  IconButton(
                    icon: const Icon(Icons.share, color: Colors.blueAccent),
                    onPressed: () {
                      Get.snackbar("مشاركة", "تمت مشاركة المقالة");
                    },
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // محتوى المقالة
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Text(
                  content,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: screenHeight * 0.020,
                    height: 1.6,
                    color: Colors.black87,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // زر العودة
              ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                style: ElevatedButton.styleFrom(
                  
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: screenWidth * 0.1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  "العودة إلى المقالات",
                  style: TextStyle(fontFamily: 'Cairo', fontWeight: FontWeight.bold),
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
