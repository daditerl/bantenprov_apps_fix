import 'package:flutter/material.dart';
import 'beritadetailpage.dart';

class BeritaPage extends StatefulWidget {
  const BeritaPage({super.key});

  @override
  State<BeritaPage> createState() => _BeritaPageState();
}

class _BeritaPageState extends State<BeritaPage> {
  final Color primaryColor = const Color(0xff1A4892);

  final TextEditingController searchController = TextEditingController();

  // ================== DUMMY DATA ==================
  final List<Map<String, String>> popularNews = [
    {
      "title": "Penguat silaturahmi ke-...",
      "date": "12/08/2025",
      "image": "assets/images/berita1.png",
    },
    {
      "title": "Gubernur Hadiri Acara...",
      "date": "10/08/2025",
      "image": "assets/images/berita2.png",
    },
    {
      "title": "Penguat silaturahmi ke-...",
      "date": "12/08/2025",
      "image": "assets/images/berita3.png",
    },
    {
      "title": "Gubernur Hadiri Acara...",
      "date": "10/08/2025",
      "image": "assets/images/berita4.png",
    },
  ];

  final List<Map<String, String>> latestNews = [
    {
      "title": "Pameran Seni Dan Budaya Dalam Rangka Ulang Tahun Banten 2026",
      "date": "26 Oktober 2025",
      "location": "Alun-Alun Serang",
      "image": "assets/images/berita5.png",
    },
    {
      "title": "Pameran Seni Dan Budaya Dalam Rangka Ulang Tahun Banten 2026",
      "date": "26 Oktober 2025",
      "location": "Alun-Alun Serang",
      "image": "assets/images/berita5.png",
    },
    {
      "title": "Pameran Seni Dan Budaya Dalam Rangka Ulang Tahun Banten 2026",
      "date": "26 Oktober 2025",
      "location": "Alun-Alun Serang",
      "image": "assets/images/berita5.png",
    },
    {
      "title": "Pameran Seni Dan Budaya Dalam Rangka Ulang Tahun Banten 2026",
      "date": "26 Oktober 2025",
      "location": "Alun-Alun Serang",
      "image": "assets/images/berita5.png",
    },
    {
      "title": "Pameran Seni Dan Budaya Dalam Rangka Ulang Tahun Banten 2026",
      "date": "26 Oktober 2025",
      "location": "Alun-Alun Serang",
      "image": "assets/images/berita5.png",
    },
    {
      "title": "Pameran Seni Dan Budaya Dalam Rangka Ulang Tahun Banten 2026",
      "date": "26 Oktober 2025",
      "location": "Alun-Alun Serang",
      "image": "assets/images/berita5.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/backgroundkalender.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // ================= HEADER =================
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          "Seputar Banten",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: primaryColor,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 48),
                  ],
                ),
              ),

              // ================= SEARCH =================
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: searchController,
                          decoration: const InputDecoration(
                            hintText: "cari artikel disini qwerty",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Icon(Icons.search, color: primaryColor),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // ================= CONTENT =================
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ================= POPULER =================
                      _sectionTitle("Populer"),
                      SizedBox(
                        height: 220,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          itemCount: popularNews.length,
                          itemBuilder: (context, index) {
                            return _popularCard(popularNews[index]);
                          },
                        ),
                      ),

                      const SizedBox(height: 16),

                      // ================= TERBARU =================
                      _sectionTitle("Terbaru"),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemCount: latestNews.length,
                        itemBuilder: (context, index) {
                          return _latestCard(
                            latestNews[index],
                            index,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ================= SECTION TITLE =================
  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: primaryColor,
        ),
      ),
    );
  }

  // ================= POPULAR CARD =================
  Widget _popularCard(Map<String, String> data) {
    return Container(
      width: 300,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.asset(
              data["image"] ?? "",
              height: 140,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    data["title"] ?? "",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const Icon(Icons.share, size: 18),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ================= LATEST CARD =================
  Widget _latestCard(Map<String, String> data, int index) {
    return GestureDetector(
      onTap: index == 0
          ? () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const BeritaDetailPage(),
                ),
              );
            }
          : null,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                data["image"] ?? "",
                width: 64,
                height: 64,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data["title"] ?? "",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "${data["date"]} • ${data["location"]}",
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
