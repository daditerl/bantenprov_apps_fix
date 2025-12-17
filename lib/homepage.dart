import 'dart:async';
import 'package:flutter/material.dart';
import 'widgets/kalenderbanten_card.dart';
import 'widgets/galeri_banten_card.dart';
import 'widgets/laporan_kinerja.dart';
import 'package:bantenprov_apps/loginpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final PageController _pageController = PageController();
  int _currentPage = 0;
  late final List<String> _kegiatanImages;
  final Duration _slideDuration = const Duration(milliseconds: 400);
  final Duration _autoPlayInterval = const Duration(seconds: 4);
  Timer? _autoPlayTimer;

  @override
  void initState() {
    super.initState();
    _kegiatanImages = [
      'assets/images/kegiatan1.png',
      'assets/images/kegiatan2.png',
    ];

    _autoPlayTimer = Timer.periodic(_autoPlayInterval, (timer) {
      final next = (_currentPage + 1) % _kegiatanImages.length;
      if (_pageController.hasClients) {
        _pageController.animateToPage(
          next,
          duration: _slideDuration,
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _autoPlayTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  final List<Map<String, dynamic>> _menuItems = [
    {'icon': 'assets/images/IconCCTVbenerbg.png', 'label': 'CCTV'},
    {'icon': 'assets/images/menu1.png', 'label': 'Span Lapor'},
    {'icon': 'assets/images/menu2.png', 'label': 'WBS'},
    {'icon': 'assets/images/menu3.png', 'label': 'Hibah Bansos'},
    {'icon': 'assets/images/menu4.png', 'label': 'OPD'},
    {'icon': 'assets/images/menu5.png', 'label': 'Info Publik'},
    {'icon': 'assets/images/menu6.png', 'label': 'FAQ'},
    {'icon': 'assets/images/menu7.png', 'label': 'Lainnya'},
  ];

  void _onNavTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xf1f1f1f1),
      appBar: AppBar(
        backgroundColor: Color(0xe9e9e9),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Color(0xFF55ADDD),
          ),
          onPressed: () {},
        ),
        title: const SizedBox(height: 0),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 0.001),
            child: Image.asset(
              'assets/images/Logobantenataskanan.png',
              height: 40,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 🔹 Header dengan Background
            SizedBox(
              width: double.infinity,
              height: 200, // atur sesuai kebutuhan
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ShaderMask(
                    shaderCallback: (rect) {
                      return const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black,
                          Colors.black,
                          Colors.transparent,
                        ],
                        stops: [0.0, 0.15, 0.85, 1.0],
                      ).createShader(rect);
                    },
                    blendMode: BlendMode.dstIn,
                    child: Image.asset(
                      'assets/images/Backgroundmain2.png',
                      fit: BoxFit.cover,
                    ),
                  ),

                  // Overlay opsional (kalau mau teks lebih jelas)
                  Container(
                    color: Colors.white.withOpacity(
                        0.0), // bisa diganti 0.2 kalau mau efek kabur
                  ),

                  // Teks di tengah
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Selamat datang di',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo,
                        ),
                      ),
                      Text(
                        'Portal Layanan',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),

            // 🔹 Logo Kabupaten
            SizedBox(
              height: 65,
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: Image.asset(
                      'assets/images/logokabupaten.png',
                      height: 65,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // 🔹 Slideshow Kegiatan
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                height: 200,
                width: size.width,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      PageView.builder(
                        controller: _pageController,
                        itemCount: _kegiatanImages.length,
                        onPageChanged: (idx) =>
                            setState(() => _currentPage = idx),
                        itemBuilder: (context, index) {
                          return Image.asset(
                            _kegiatanImages[index],
                            fit: BoxFit.cover,
                          );
                        },
                      ),

                      // indikator titik
                      Positioned(
                        bottom: 8,
                        left: 0,
                        right: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(_kegiatanImages.length, (i) {
                            final isActive = i == _currentPage;
                            return AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              width: isActive ? 12 : 8,
                              height: isActive ? 12 : 8,
                              decoration: BoxDecoration(
                                color: isActive ? Colors.white : Colors.white70,
                                shape: BoxShape.circle,
                              ),
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // 🔹 Grid Menu Layanan
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  decoration: BoxDecoration(
                    color: Color(0xf1f1f1f1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: GridView.count(
                    crossAxisCount: 4,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: _menuItems.map((item) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircleAvatar(
                            radius: 26,
                            backgroundColor:
                                Colors.blue.shade100.withOpacity(0.4),
                            child: Image.asset(
                              item['icon'],
                              width: 26,
                              height: 26,
                              color: const Color(
                                  0xFF1985BF), // <-- warna biru branding Banten
                              colorBlendMode: BlendMode.srcIn,
                              fit: BoxFit.contain,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            item['label'],
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 11),
                          ),
                        ],
                      );
                    }).toList(),
                  )),
            ),
            // 🔹 Berita & Informasi Section
            // 🔹 Grid Menu Layanan

            const SizedBox(height: 20),

// 🔹 Berita & Informasi Section - SLIDER
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: StatefulBuilder(
                builder: (context, setStateSB) {
                  final PageController beritaController = PageController();
                  int currentIndex = 0;

                  final List<Map<String, String>> beritaData = [
                    {
                      "gambar": "assets/images/beritaInformasiHome.png",
                      "judul": "Penguat silaturahmi ke…..",
                      "isi":
                          "Pada tanggal 12/08/2025 Maulid diselenggarakan oleh pemerintah setempat untuk mempererat hubungan masyarakat…"
                    },
                    {
                      "gambar": "assets/images/beritaInformasiHome.png",
                      "judul": "Pemerintah gelar rapat koordinasi…",
                      "isi":
                          "Rapat koordinasi dilakukan untuk menyiapkan program strategis yang berdampak langsung kepada masyarakat…"
                    },
                    {
                      "gambar": "assets/images/beritaInformasiHome.png",
                      "judul": "Kegiatan sosial bersama warga…",
                      "isi":
                          "Gerakan kebersihan lingkungan dilakukan bersama warga dan perangkat desa untuk menciptakan desa bersih…"
                    },
                  ];

                  return Container(
                    decoration: BoxDecoration(
                      color: Color(0xf1f1f1f1),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Judul
                        const Padding(
                          padding: EdgeInsets.all(12),
                          child: Text(
                            "BERITA & INFORMASI",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.indigo,
                            ),
                          ),
                        ),

                        // SLIDER BERITA
                        SizedBox(
                          height: 310,
                          child: PageView.builder(
                            controller: beritaController,
                            itemCount: beritaData.length,
                            onPageChanged: (index) {
                              setStateSB(() {
                                currentIndex = index;
                              });
                            },
                            itemBuilder: (context, index) {
                              final item = beritaData[index];

                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Container(
                                    color: Color(0xf6f6f6f6),
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          item["gambar"]!,
                                          height: 160,
                                          width: double.infinity,
                                          fit: BoxFit.cover,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox(height: 10),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      item["judul"]!,
                                                      style: const TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: Colors.indigo,
                                                      ),
                                                    ),
                                                  ),
                                                  const Icon(Icons.share,
                                                      color: Colors.grey),
                                                ],
                                              ),
                                              const SizedBox(height: 6),
                                              Text(
                                                item["isi"]!,
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.black87,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),

                        const SizedBox(height: 10),

                        // Indikator titik
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(beritaData.length, (index) {
                            return AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              width: currentIndex == index ? 12 : 8,
                              height: currentIndex == index ? 12 : 8,
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              decoration: BoxDecoration(
                                color: currentIndex == index
                                    ? Colors.indigo
                                    : Colors.grey.shade400,
                                shape: BoxShape.circle,
                              ),
                            );
                          }),
                        ),

                        const SizedBox(height: 15),

                        // Tombol Lihat Semua
                        Center(
                          child: Container(
                            width: 140,
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

                        const SizedBox(height: 20),
                      ],
                    ),
                  );
                },
              ),
            ),
            const KalenderBantenCard(),
            const SizedBox(height: 10),

            const GaleriBantenCard(),
            const SizedBox(
              height: 30,
            ),
            const LaporanKinerja(),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: (index) {
              if (index == 2) {
                // 👉 Navigasi ke LoginPage
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              } else {
                setState(() {
                  _selectedIndex = index;
                });
              }
            },
            backgroundColor: Colors.white,
            selectedItemColor: Colors.indigo,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  child: Icon(
                    Icons.home,
                    size: _selectedIndex == 0 ? 30 : 24,
                  ),
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  child: Icon(
                    Icons.public,
                    size: _selectedIndex == 1 ? 30 : 24,
                  ),
                ),
                label: 'Layanan Publik',
              ),
              BottomNavigationBarItem(
                icon: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  child: Icon(
                    Icons.account_balance,
                    size: _selectedIndex == 2 ? 30 : 24,
                  ),
                ),
                label: 'Tata Kelola',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
