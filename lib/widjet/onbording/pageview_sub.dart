import 'package:aldana551/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aldana551/controloer/homecontroler.dart';

class PageviewSub extends StatefulWidget {
  const PageviewSub({super.key});

  @override
  State<PageviewSub> createState() => _PageviewSubState();
}

class _PageviewSubState extends State<PageviewSub> {
  @override
 @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return PageView.builder(
      controller:  pageController,
      onPageChanged: (val){
        controller.onchaned(val);
      },
      itemCount: 3,
      itemBuilder: (context, i) {
        return Column(
          children: [
            const SizedBox(height: 40),
            Icon(
              _getIconForPage(i),
              size: screenWidth * 0.4,
              color: const Color(0xFF0099FF),
            ),
            const SizedBox(height: 30),
            Text(
              _getTitleForPage(i),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Color(0xFF0099FF),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                _getSubtitleForPage(i),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  IconData _getIconForPage(int i) {
    switch (i) {
      case 0:
        return Icons.child_care;
      case 1:
        return Icons.health_and_safety;
      case 2:
        return Icons.local_hospital;
      default:
        return Icons.help_outline;
    }
  }

  String _getTitleForPage(int i) {
    switch (i) {
      case 0:
        return "الصحة للأطفال";
      case 1:
        return "التوعية الصحية";
      case 2:
        return "خدمات الرعاية الصحية";
      default:
        return "عنوان غير محدد";
    }
  }

  String _getSubtitleForPage(int i) {
    switch (i) {
      case 0:
        return "معلومات وموارد مخصصة لصحة الأطفال";
      case 1:
        return "تعرف على حملات التوعية الصحية المتوفرة";
      case 2:
        return "معلومات عن العيادات والخدمات الصحية المتاحة";
      default:
        return "وصف غير متوفر";
    }
  }
}
