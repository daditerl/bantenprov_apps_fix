import 'package:flutter/material.dart';
import 'homepage.dart';
import 'loginpage.dart';

class LayananPublikPage extends StatefulWidget {
  const LayananPublikPage({super.key});

  @override
  State<LayananPublikPage> createState() => _LayananPublikPageState();
}

class _LayananPublikPageState extends State<LayananPublikPage> {
  int _selectedIndex = 1; // ✅ Layanan Publik aktif

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      extendBody: true,

      body: Stack(
        children: [
          Positioned.fill(
            child: SizedBox.expand(
              child: Image.asset(
                "assets/images/background_publik.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Transform.translate(
                  offset: const Offset(0, -20), // ✅ -20 = naik ke atas
                  child: Image.asset(
                    "assets/images/logoUmahBantenpolos.png",
                    height: 70,
                  ),
                ),

                const SizedBox(height: 25),

                // ------------------ UMUM --------------------
                _buildSection(
                  title: "Umum",
                  items: [
                    _menuItem(
                        "assets/images/hibah_bansos.png", "Hibah\nBansos"),
                    _menuItem(
                        "assets/images/jadwal_dokter.png", "Jadwal\nDokter"),
                    _menuItem("assets/images/span_lapor.png", "SPAN\nLapor"),
                    _menuItem("assets/images/cctv.png", "CCTV"),
                    _menuItem("assets/images/lpse.png", "LPSE"),
                    _menuItem("assets/images/wbs.png", "WBS"),
                    _menuItem("assets/images/pkb.png", "PKB"),
                    _menuItem(
                        "assets/images/menara_banten.png", "Menara\nBanten"),
                    _menuItem("assets/images/siloker.png", "Siloker"),
                    _menuItem("assets/images/csirt.png", "CSIRT"),
                    _menuItem("assets/images/bumilfit.png", "BumilFit"),
                    _menuItem("assets/images/pendaftaran_pasien.png",
                        "Pendaftaran\nPasien"),
                    _menuItem("assets/images/sibenda.png", "SIBENDA"),
                    _menuItem("assets/images/simanis2.png", "SIMANIS"),
                    _menuItem("assets/images/laju_pkb.png", "Laju PKB"),
                    _menuItem(
                        "assets/images/aduan_konten.png", "Aduan\nKonten"),
                    _menuItem("assets/images/rekrutment.png", "Rekrutmen"),
                    _menuItem("assets/images/skm.png", "SKM"),
                    _menuItem("assets/images/sipelaku.png", "SIPELAKU"),
                    _menuItem("assets/images/antrisamsat.png", "Antri\nSamsat"),
                    _menuItem("assets/images/sisi_baja.png", "Sisi\nBaja"),
                    _menuItem("assets/images/sitatap.png", "SITATAP"),
                    _menuItem(
                      "assets/images/esapa.png",
                      "e-Sapa",
                      useBlue: false,
                    ),
                    _menuItem("assets/images/simparda.png", "SIMPARDA"),
                    _menuItem("assets/images/etoko_pkk.png", "e-TokoPKK"),
                    _menuItem(
                      "assets/images/rsud_malimping.png",
                      "RSUD\nMalimping",
                      useBlue: false,
                    ),
                    _menuItem(
                      "assets/images/damkar.png",
                      "Damkar",
                      useBlue: false,
                    ),
                    _menuItem(
                        "assets/images/antri_samsat.png", "Antri\nSamsat"),
                    _menuItem("assets/images/ikm_bapenda.png", "IKM\nBapenda"),
                  ],
                ),

                const SizedBox(height: 30),

                // ------------------ DATA --------------------
                _buildSection(
                  title: "Data",
                  items: [
                    _menuItem("assets/images/jdih.png", "JDIH"),
                    _menuItem("assets/images/satu_data.png", "Satu\nData"),
                    _menuItem("assets/images/eppid.png", "e-PPID"),
                    _menuItem("assets/images/gistaru.png", "GISTARU"),
                    _menuItem("assets/images/sipagi.png", "SIPAGI"),
                    _menuItem("assets/images/edasawisma.png", "e-Dasawisma"),
                    _menuItem("assets/images/open_data.png", "Open\nData"),
                    _menuItem("assets/images/jdih_dprd.png", "JDIH\nDPRD"),
                    _menuItem("assets/images/sidakep.png", "SIDAKEP"),
                    _menuItem("assets/images/batu_pusaka.png", "Batu\nPusaka"),
                    _menuItem(
                      "assets/images/sidakbanten3.png",
                      "Sidak\nBanten",
                      useBlue: false,
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                // ------------------ KABUPATEN KOTA --------------------
                _buildSection(
                  title: "Kabupaten Kota",
                  items: [
                    _menuItem(
                      "assets/images/kabupaten_lebak.png",
                      "Kabupaten\nLebak",
                      useBlue: false,
                    ),
                    _menuItem(
                      "assets/images/kabupaten_pandeglang.png",
                      "Kabupaten\nPandeglang",
                      useBlue: false,
                    ),
                    _menuItem(
                      "assets/images/kabupaten_serang.png",
                      "Kabupaten\nSerang",
                      useBlue: false,
                    ),
                    _menuItem(
                      "assets/images/kabupaten_tangerang.png",
                      "Kabupaten\nTangerang",
                      useBlue: false,
                    ),
                    _menuItem(
                      "assets/images/kota_cilegon.png",
                      "Kota\nCilegon",
                      useBlue: false,
                    ),
                    _menuItem(
                      "assets/images/kota_serang.png",
                      "Kota\nSerang",
                      useBlue: false,
                    ),
                    _menuItem(
                      "assets/images/kota_tangerang.png",
                      "Kota\nTangerang",
                      useBlue: false,
                    ),
                    _menuItem(
                      "assets/images/kota_tangerang_selatan.png",
                      "Kota\nTangerang Selatan",
                      useBlue: false,
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                // ------------------ PERIZINAN --------------------
                _buildSection(
                  title: "Perizinan",
                  items: [
                    _menuItem("assets/images/sipeka.png", "SIPEKA"),
                    _menuItem("assets/images/oss.png", "OSS"),
                    _menuItem("assets/images/potensi_investasi.png",
                        "Potensi\nInvestasi"),
                    _menuItem("assets/images/sipitak.png", "SIPITAK"),
                    _menuItem("assets/images/perizinan_lingkungan.png",
                        "Perizinan\nLingkungan"),
                  ],
                ),

                const SizedBox(height: 100),
              ],
            ),
          ),
          Positioned(
            top: 12,
            left: 20,
            child: SafeArea(
              left: false, // 👈 PENTING
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        blurRadius: 6,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.arrow_back,
                    size: 18,
                    color: Color(0xFF273977),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),

      // ------------------ BOTTOM NAVIGATION --------------------
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
              if (index == 0) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              } else if (index == 2) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
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

  // ----------------------------------------------------------
  //                  SECTION WRAPPER
  // ----------------------------------------------------------
  Widget _buildSection({
    required String title,
    required List<Widget> items,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Color(0xff1A4892),
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            height: 1,
            width: double.infinity,
            color: Colors.indigo.shade300,
          ),
          const SizedBox(height: 14),
          Wrap(
            spacing: 12,
            runSpacing: 18,
            alignment: WrapAlignment.start,
            children: items,
          ),
        ],
      ),
    );
  }

  // ----------------------------------------------------------
  //                    MENU ITEM
  // ----------------------------------------------------------
  Widget _menuItem(
    String imagePath,
    String label, {
    bool useBlue = true,
  }) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 4 - 28,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                center: Alignment.topLeft, // 🔑 highlight di atas
                radius: 1.1,
                colors: [
                  Color(0xFFFFFFFF), // putih kebiruan (highlight)
                  Color(0xFFEAF6FD), // biru muda
                  Color(0xFFD6ECF8), // biru utama figma
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF55ADDD).withOpacity(0.25),
                  blurRadius: 6,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: useBlue
                ? Image.asset(
                    imagePath,
                    width: 30,
                    height: 30,
                    fit: BoxFit.contain,
                    color: const Color(0xFF55ADDD), // 🔵 FIX FIGMA
                    colorBlendMode: BlendMode.srcIn,
                  )
                : Image.asset(
                    imagePath,
                    width: 30,
                    height: 30,
                    fit: BoxFit.contain,
                  ),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          )
        ],
      ),
    );
  }
}
