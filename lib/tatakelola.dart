import 'package:bantenprov_apps/layananpublikpage.dart';
import 'package:flutter/material.dart';
import 'homepage.dart';

const Color iconBlue = Color(0xFF55ADDD);
const Color iconBgBlue = Color(0xFF55ADDD);

class TataKelolaPage extends StatefulWidget {
  const TataKelolaPage({super.key});

  @override
  State<TataKelolaPage> createState() => _TataKelolaPageState();
}

class _TataKelolaPageState extends State<TataKelolaPage> {
  int _selectedIndex = 2; // 👉 Tata Kelola aktif

  void _onNavTapped(int index) {
    if (index == 2) return;

    if (index == 0) {
      Navigator.pop(context);
    } else if (index == 1) {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/images/bglogin.png",
              fit: BoxFit.fill,
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 110, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/logoUmahBantenpolos.png",
                  height: 70,
                ),
                const SizedBox(height: 25),

                // ------------------ UMUM --------------------
                _buildSection(
                  title: "Umum",
                  items: [
                    _menuItem("assets/images/fingerprint.png", "E-SIGN"),
                    _menuItem("assets/images/umum2.png", "WebMail"),
                    _menuItem("assets/images/umum3.png", "Drive Cloud"),
                    _menuItem("assets/images/umum4.png", "SIMPELIN"),
                    _menuItem("assets/images/umum5.png", "DMS PPID"),
                    _menuItem("assets/images/umum6.png", "SIMASTEN"),
                    _menuItem("assets/images/umum7.png", "SERAMBI"),
                    _menuItem("assets/images/umum8.png", "Sireda"),
                    _menuItem("assets/images/umum9.png", "SIREDA"),
                  ],
                ),

                const SizedBox(height: 20),

                // ------------------ MONITORING --------------------
                _buildSection(
                  title: "Monitoring",
                  items: [
                    _menuItem("assets/images/monitoring1.png", "NMS"),
                    _menuItem("assets/images/monitoring2.png", "SIPANSER"),
                    _menuItem("assets/images/monitoring3.png", "API Manager"),
                    _menuItem("assets/images/monitoring4fix.png", "Pimpinan"),
                  ],
                ),

                const SizedBox(height: 20),

                // ------------------ ADMINISTRATOR --------------------
                _buildSection(
                  title: "Administrator",
                  items: [
                    _menuItem("assets/images/admin1.png", "Users"),
                    _menuItem("assets/images/admin2.png", "Roles"),
                    _menuItem("assets/images/admin3.png", "Settings"),
                  ],
                ),

                const SizedBox(height: 100),
              ],
            ),
          ),
          // ================= BACK BUTTON =================
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
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, -2),
            )
          ],
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
              } else if (index == 1) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LayananPublikPage()),
                );
              } else if (index == 2) {
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
                icon: Icon(
                  Icons.home,
                  size: _selectedIndex == 0 ? 30 : 24,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.public,
                  size: _selectedIndex == 1 ? 30 : 24,
                ),
                label: 'Layanan Publik',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_balance,
                  size: _selectedIndex == 2 ? 30 : 24,
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
              fontSize: 15,
            ),
          ),

          const SizedBox(height: 8),

          Container(
            height: 1,
            width: double.infinity,
            color: Colors.indigo.shade300,
          ),

          const SizedBox(height: 14),

          // GRID 4 ITEMS PER BARIS
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
  //                    MENU ITEM (4 / ROW)
  // ----------------------------------------------------------
  Widget _menuItem(String assetPath, String label) {
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
            child: Image.asset(
              assetPath,
              width: 24,
              height: 24,
              fit: BoxFit.contain,
              color: iconBlue, // 🔵 ICON #55ADDD
              colorBlendMode: BlendMode.srcIn,
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
          ),
        ],
      ),
    );
  }
}
