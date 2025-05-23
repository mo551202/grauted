import 'package:aldana551/screen/Home.dart';
import 'package:aldana551/screen/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Logincontactuspage extends StatelessWidget {
  Logincontactuspage({super.key});

  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  final String whatsappNumber = "+905345711710"; // رقم الهاتف بدون +

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('اتصل بنا'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'نحن هنا لمساعدتك! يرجى ملء النموذج أدناه.',
                style: TextStyle(fontSize: 16, color: Colors.black54),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: nameController,
                decoration: _inputDecoration('الاسم الكامل'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'الرجاء إدخال الاسم';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: emailController,
                decoration: _inputDecoration('البريد الإلكتروني'),
                validator: (value) {
                  if (value == null || !value.contains('@')) {
                    return 'الرجاء إدخال بريد إلكتروني صحيح';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: messageController,
                maxLines: 4,
                decoration: _inputDecoration('رسالتك'),
                validator: (value) {
                  if (value == null || value.length < 10) {
                    return 'الرجاء كتابة رسالة أطول';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 25),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('تم إرسال الرسالة بنجاح'),
                        backgroundColor: Colors.green,
                      ),
                    );
                    nameController.clear();
                    emailController.clear();
                    messageController.clear();
                  }
                },
                child: const Text(
                  'إرسال',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              const SizedBox(height: 15),
              OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.teal),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                onPressed: () {
                  _openWhatsApp(context);
                },
                icon: const Icon(Icons.message, color: Colors.teal),
                label: const Text(
                  'مراسلتنا عبر الواتساب',
                  style: TextStyle(color: Colors.teal, fontSize: 16),
                ),
              ),
              const SizedBox(height: 20),
              Divider(color: Colors.grey[300]),
              const SizedBox(height: 10),
              TextButton.icon(
                onPressed: () {
                  Get.offAll(Login()); // ترجع للصفحة السابقة (الرئيسية)
                },
                icon: const Icon(Icons.home, color: Colors.teal),
                label: const Text(
                 "العودة لصفحة تسجيل الدخول",
                  style: TextStyle(color: Colors.teal, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      floatingLabelBehavior: FloatingLabelBehavior.always,
      contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.teal),
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }

  void _openWhatsApp(BuildContext context) {
    final String message = Uri.encodeComponent("مرحبًا، أحتاج للمساعدة");
    final String url = "https://wa.me/$whatsappNumber?text=$message";

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('التواصل عبر الواتساب'),
        content: Text('للتواصل عبر الواتساب اضغط على الرابط:\n\n$url'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('إغلاق'),
          ),
        ],
      ),
    );
  }
}
