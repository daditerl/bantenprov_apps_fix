import 'package:flutter/material.dart';

class GaleriBantenCard extends StatelessWidget {
  const GaleriBantenCard({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> galeriData = [
      {
        "image": "assets/images/galeri1.png",
        "title":
            "Dua Siswa Banten Siap Kibarkan Merah Putih Di Istana Negara | Banten Sepekan"
      },
      {
        "image": "assets/images/galeri2.png",
        "title": "Melihat Berbagai Perspektif Dari Jendela Informasi Banten"
      },
      {
        "image": "assets/images/galeri3.png",
        "title":
            "Dua Siswa Banten Siap Kibarkan Merah Putih Di Istana Negara | Banten Sepekan"
      },
      {
        "image": "assets/images/galeri4.png",
        "title": "Melihat Berbagai Perspektif Dari Jendela Informasi Banten"
      },
      {
        "image": "assets/images/galeri5.png",
        "title": "Seniman Banten Gelar Pameran Budaya"
      },
      {
        "image": "assets/images/galeri6.png",
        "title": "Kegiatan Sosial Pemuda Banten"
      },
      {
        "image": "assets/images/galeri7.png",
        "title": "Festival Kuliner Khas Banten qwerty"
      },
      {
        "image": "assets/images/galeri8.png",
        "title": "Potret Wisata Alam Ujung Kulon"
      },
    ];

    // Bagi data menjadi list berisi pasangan 2 item per kolom
    List<List<Map<String, String>>> columns = [];
    for (int i = 0; i < galeriData.length; i += 2) {
      columns.add(galeriData.sublist(
        i,
        i + 2 > galeriData.length ? galeriData.length : i + 2,
      ));
    }

    return Container(
      // === BACKGROUND IMAGE DI SINI ===
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bg_galeri.png"), // ganti gambar kamu
          fit: BoxFit.cover,
        ),
      ),

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            const Text(
              "GALERI BANTEN",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),

            const SizedBox(height: 8),
            Container(height: 1, color: Colors.indigo),
            const SizedBox(height: 20),

            // === ITEM 2 BARIS (SCROLL HORIZONTAL) ===
            SizedBox(
              height: 380,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: columns.length,
                itemBuilder: (context, index) {
                  final columnItems = columns[index];

                  return Container(
                    width: 180,
                    margin: const EdgeInsets.only(right: 16),
                    child: Column(
                      children: List.generate(columnItems.length, (i) {
                        final item = columnItems[i];

                        return Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  item["image"]!,
                                  height: 120,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                item["title"]!,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            Center(
              child: Container(
                width: 160,
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: const Color(0xff1A76D1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Text(
                  "Lihat Semua",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 35),
          ],
        ),
      ),
    );
  }
}
