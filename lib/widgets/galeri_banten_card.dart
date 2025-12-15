import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class GaleriBantenCard extends StatelessWidget {
  const GaleriBantenCard({super.key});

  // fungsi untuk membuka link
  Future<void> _openLink(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Tidak bisa membuka $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> galeriData = [
      {
        "image": "assets/images/galeri1.png",
        "title":
            "Dua Siswa Banten Siap Kibarkan Merah Putih Di Istana Negara | Banten Sepekan",
        "url": "https://example.com/example1"
      },
      {
        "image": "assets/images/galeri2.png",
        "title": "Melihat Berbagai Perspektif Dari Jendela Informasi Banten",
        "url": "https://example.com/example2"
      },
      {
        "image": "assets/images/galeri3.png",
        "title":
            "Dua Siswa Banten Siap Kibarkan Merah Putih Di Istana Negara | Banten Sepekan",
        "url": "https://example.com/example3"
      },
      {
        "image": "assets/images/galeri4.png",
        "title": "Melihat Berbagai Perspektif Dari Jendela Informasi Banten",
        "url": "https://example.com/example4"
      },
      {
        "image": "assets/images/galeri5.png",
        "title": "Seniman Banten Gelar Pameran Budaya",
        "url": "https://example.com/example5"
      },
      {
        "image": "assets/images/galeri6.png",
        "title": "Kegiatan Sosial Pemuda Banten",
        "url": "https://example.com/example6"
      },
      {
        "image": "assets/images/galeri7.png",
        "title": "Festival Kuliner Khas Banten qwerty",
        "url": "https://example.com/example7"
      },
      {
        "image": "assets/images/galeri8.png",
        "title": "Potret Wisata Alam Ujung Kulon",
        "url": "https://example.com/example8"
      },
    ];

    // Bagi data menjadi pasangan 2 item per kolom
    List<List<Map<String, String>>> columns = [];
    for (int i = 0; i < galeriData.length; i += 2) {
      columns.add(
        galeriData.sublist(
          i,
          i + 2 > galeriData.length ? galeriData.length : i + 2,
        ),
      );
    }

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bg_galeri.png"),
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

            // LIST GALERI (SCROLL HORIZONTAL, 2 BARIS)
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
                          child: InkWell(
                            borderRadius: BorderRadius.circular(12),
                            onTap: () => _openLink(item["url"]!),
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
                          ),
                        );
                      }),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 35),
          ],
        ),
      ),
    );
  }
}
