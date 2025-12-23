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
      extendBody: false,

      body: Stack(
        children: [
          Positioned.fill(
            child: SizedBox.expand(
              child: Image.asset(
                "assets/images/bglogin.png",
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
                    _menuItem("assets/images/simanis.png", "SIMANIS"),
                    _menuItem("assets/images/laju_pkb.png", "Laju PKB"),
                    _menuItem(
                        "assets/images/aduan_konten.png", "Aduan\nKonten"),
                    _menuItem("assets/images/rekrutment.png", "Rekrutmen"),
                    _menuItem("assets/images/skm.png", "SKM"),
                    _menuItem("assets/images/sipelaku.png", "SIPELAKU"),
                    _menuItem("assets/images/antrisamsat.png", "Antri\nSamsat"),
                    _menuItem("assets/images/sisi_baja.png", "Sisi\nBaja"),
                    _menuItem("assets/images/sitatap.png", "SITATAP"),
                    _menuItem("assets/images/esapa.png", "e-Sapa"),
                    _menuItem("assets/images/simparda.png", "SIMPARDA"),
                    _menuItem("assets/images/etoko_pkk.png", "e-TokoPKK"),
                    _menuItem(
                        "assets/images/rsud_malimping.png", "RSUD\nMalimping"),
                    _menuItem("assets/images/damkar.png", "Damkar"),
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
                    _menuItem("assets/images/sidakbanten.png", "Sidak\nBanten"),
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
      bottomNavigationBar: BottomNavigationBar(
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
        elevation: 8,
        selectedItemColor: Colors.indigo,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.public),
            label: 'Layanan Publik',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance),
            label: 'Tata Kelola',
          ),
        ],
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
    bool useBlue = true, // default: biru
  }) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 4 - 28,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: const Color(0xFFBBDEFB).withOpacity(0.4),
              shape: BoxShape.circle,
            ),
            child: useBlue
                ? ColorFiltered(
                    colorFilter: const ColorFilter.mode(
                      Color.fromARGB(
                          255, 132, 176, 226), // 🔵 biru Figma (lebih soft)
                      BlendMode.modulate, // ⬅️ PENTING (lebih natural)
                    ),
                    child: Image.asset(
                      imagePath,
                      width: 30,
                      height: 30,
                      fit: BoxFit.contain,
                    ),
                  )
                : Image.asset(
                    imagePath, // ⬅ tanpa warna (asli)
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
