import 'package:aldana551/http_sub.dart';
import 'package:aldana551/main.dart';
import 'package:aldana551/widjet/vaccine/vaccinechildren_next_prefix.dart';
import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> with SingleTickerProviderStateMixin {
  TabController? tabController;
  respon ins = respon();

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  // Fetch vaccines data
  Future<Map<String, dynamic>?> viewVaccin() async {
    var respons = await ins.postRequst(
        "http://$linkconact/cours1/vaccinesChildren.php",
        {"id": sharedPreferences.get("idChildren")});
    if (respons['s'] == "sucsses") {
      return respons;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF0F8FF),
        appBar: AppBar(
          toolbarHeight: screenHeight * 0.07,
          elevation: 3,
             flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xFF81D4FA), // أزرق سماوي ناعم
                Color(0xFF4CAF50), // أخضر هادئ
              ],
            ),
          ),
        ),
          title: const Text(
            "جدول اللقاحات",
            style: TextStyle(
              fontFamily: 'Cairo',
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
          centerTitle: true,
          bottom: TabBar(
            controller: tabController,
           indicator: UnderlineTabIndicator(
            borderSide: BorderSide(width: 3.0, color: Color(0xFFb2dfdb)),
            insets: EdgeInsets.symmetric(horizontal: 1, vertical: 0.5),
          ),
          indicatorWeight: 2,
          labelColor: Colors.white,
          unselectedLabelColor: Color(0xFF004f7c), // اللون الداكن للأزرار غير المختارة
          unselectedLabelStyle: TextStyle(fontSize: 12,fontFamily: 'cairo'),
          labelStyle: TextStyle(fontSize: 14,fontFamily: 'cairo'),
            tabs: const [
              Tab(
                icon: Icon(Icons.next_plan),
                text: "اللقاحات التالية",
              ),
              Tab(
                icon: Icon(Icons.history),
                text: "اللقاحات السابقة",
              ),
            ],
          ),
        ),
        body: TabBarView(controller: tabController, children: [
          // Tab 1 - Next Vaccines
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            child: FutureBuilder(
              future: viewVaccin(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                      child: CircularProgressIndicator(
                          color: Color(0xFF4DB6AC)));
                }
                if (snapshot.hasData &&
                    snapshot.data != null &&
                    snapshot.data!['data'] != null) {
                  var data = snapshot.data!['data'];
                  return ListView.separated(
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 10),
                    itemCount: data.length,
                    itemBuilder: (context, i) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 6,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: VaccinechildrenNextPrefix(
                          nameVaccin: data[i]['vaccineNext'] ?? "",
                          dateVaccin: data[i]['timeNext'] ?? "",
                          centerVaccin: "",
                        ),
                      );
                    },
                  );
                }
                return const Center(
                  child: Text(
                    "لا يوجد لقاحات لهذا الطفل، راجع أقرب مركز",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54),
                    textAlign: TextAlign.center,
                  ),
                );
              },
            ),
          ),

          // Tab 2 - Previous Vaccines
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            child: FutureBuilder(
              future: viewVaccin(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                      child: CircularProgressIndicator(
                          color: Color(0xFF4DB6AC)));
                }
                if (snapshot.hasData &&
                    snapshot.data != null &&
                    snapshot.data!['data'] != null) {
                  var data = snapshot.data!['data'];
                  return ListView.separated(
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 10),
                    itemCount: data.length,
                    itemBuilder: (context, i) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 6,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: VaccinechildrenNextPrefix(
                          nameVaccin: data[i]['vaccinePrefix'] ?? "",
                          dateVaccin: data[i]['timePrefix'] ?? "",
                          centerVaccin: "",
                        ),
                      );
                    },
                  );
                }
                return const Center(
                  child: Text(
                    "لا يوجد لقاحات لهذا الطفل، راجع أقرب مركز",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54),
                    textAlign: TextAlign.center,
                  ),
                );
              },
            ),
          ),
        ]),
      ),
    );
  }
}
