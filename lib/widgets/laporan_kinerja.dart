import 'package:flutter/material.dart';

class LaporanKinerja extends StatelessWidget {
  const LaporanKinerja({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> laporanItems = [
      {"image": "assets/images/laporan1.png"},
      {"image": "assets/images/laporan2.png"},
      {"image": "assets/images/laporan3.png"},
      {"image": "assets/images/laporan4.png"},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xf1f1f1f1),
          borderRadius: BorderRadius.circular(15),

          // 🔥 Drop Shadow Halus (opacity 0.08)
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5),
            const Text(
              "LAPORAN KINERJA",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color(0xff1A4892),
              ),
            ),
            const SizedBox(height: 6),
            Container(
              height: 1,
              width: double.infinity,
              color: Colors.indigo.shade300,
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 180,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: laporanItems.length,
                itemBuilder: (context, index) {
                  final item = laporanItems[index];

                  return Container(
                    width: 150,
                    margin: const EdgeInsets.only(right: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xffc7d4f7),
                          Color(0xffe8c4df),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        item["image"]!,
                        width: 150,
                        height: 180,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
