import 'package:aldana551/widjet/Reproductivehealth_article/ArticleDetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class bodyArticleFamilyplanningArticle extends StatefulWidget {
  bodyArticleFamilyplanningArticle({super.key, required this.namearticle, required this.textarticle, required this.datearticle});
  
  final String namearticle;
  final String textarticle;
  final String datearticle;

  @override
  State<bodyArticleFamilyplanningArticle> createState() => _bodyArticleState();
}

class _bodyArticleState extends State<bodyArticleFamilyplanningArticle> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.only(right: screenHeight * 0.008,top: screenHeight * 0.009,left: screenHeight * 0.005),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [Colors.white, Color(0xFFE3F2FD)],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.health_and_safety, color: Colors.blueAccent, size: 15),
                        const SizedBox(width: 8),
                        // تفعيل التفاف النص مع إضافة نقاط الحذف إذا كان النص طويلًا
                        Text(
                          widget.namearticle,
                          softWrap: true,  // تفعيل التفاف النص
                          overflow: TextOverflow.ellipsis,  // إضافة نقاط الحذف إذا تجاوز النص الحد
                          style: TextStyle(
                            fontSize: screenHeight * 0.02,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.015),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  "images/11.jpg",
                  width: 70,
                  height: 70,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.015),
          Text(
            widget.textarticle.length > 100 
              ? widget.textarticle.substring(0, 100) + " ..." 
              : widget.textarticle,
            style: TextStyle(
              fontSize: screenHeight * 0.018,
              color: Colors.black87,
              height: 1.5,
            ),
          ),
          SizedBox(height: screenHeight * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.datearticle,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: screenHeight * 0.016,
                ),
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.share, color: Colors.blueAccent),
                    onPressed: () {
                      Get.snackbar("مشاركة", "تمت مشاركة المقالة");
                    },
                  ),
                ],
              )
            ],
          ),
          /// زر قراءة المزيد
          Align(
            alignment: Alignment.centerLeft,
            child: TextButton(
              onPressed: () {
              Get.to(ArticleDetails(title: widget.namearticle,content: widget.textarticle,date: widget.datearticle,));
              },
              child: const Text(
                "قراءة المزيد",
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
