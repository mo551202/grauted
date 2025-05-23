import 'package:aldana551/http_sub.dart';
import 'package:aldana551/main.dart';
import 'package:flutter/material.dart';

class CenterNamePage extends StatelessWidget {
  CenterNamePage({super.key});

  final respon ins = respon();

  Future namecenter() async {
    var respons = await ins.postRequst(
      "http://$linkconact/cours1/CenterName.php",
      {"id": sharedPreferences.get("idCity")},
    );

    if (respons['s'] == "sucsses") {
      return respons;
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF4F6F8),
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: screenHeight * 0.07,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF4CAF50),
                  Color(0xFF81D4FA),
                ],
              ),
            ),
          ),
          title: const Text(
            "أسماء المراكز",
            style: TextStyle(
              fontFamily: 'Cairo',
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          centerTitle: true,
        ),
        body: FutureBuilder(
          future: namecenter(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.teal,
                ),
              );
            }

            if (snapshot.hasData) {
              var data = snapshot.data['data'];
              return Padding(
                padding: const EdgeInsets.all(12),
                child: ListView.separated(
                  itemCount: data.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 12),
                  itemBuilder: (context, i) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 8,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.local_hospital,
                                    color: Colors.teal, size: 22),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    data[i]['name'],
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.teal,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                const Icon(Icons.location_on,
                                    color: Colors.grey, size: 20),
                                const SizedBox(width: 6),
                                Expanded(
                                  child: Text(
                                    data[i]['address'] ?? 'العنوان غير متوفر',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                const Icon(Icons.phone,
                                    color: Colors.grey, size: 20),
                                const SizedBox(width: 6),
                                Text(
                                  data[i]['phone'] ?? 'لا يوجد رقم',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            }

            return Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  "لا يوجد مراكز متاحة حاليًا.\nيرجى مراجعة أقرب مركز صحي.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.red[600]),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
