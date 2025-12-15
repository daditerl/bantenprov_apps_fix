import 'package:flutter/material.dart';
import 'homepage.dart';

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

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF273977)),
          onPressed: () => Navigator.pop(context),
        ),
      ),

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
                    _menuItem(Icons.fingerprint, "E-SIGN"),
                    _menuItem(Icons.mail, "WebMail"),
                    _menuItem(Icons.cloud, "Drive Cloud"),
                    _menuItem(Icons.circle, "SIMPELIN"),
                    _menuItem(Icons.folder, "DMS PPID"),
                    _menuItem(Icons.view_list, "SIMASTEN"),
                    _menuItem(Icons.security, "SERAMBI"),
                    _menuItem(Icons.insert_drive_file, "Sireda"),
                    _menuItem(Icons.shield, "SIREDA"),
                  ],
                ),

                const SizedBox(height: 20),

                // ------------------ MONITORING --------------------
                _buildSection(
                  title: "Monitoring",
                  items: [
                    _menuItem(Icons.hub, "NMS"),
                    _menuItem(Icons.settings, "SIPANSER"),
                    _menuItem(Icons.api, "API Manager"),
                    _menuItem(Icons.people, "Pimpinan"),
                  ],
                ),

                const SizedBox(height: 20),

                // ------------------ ADMINISTRATOR --------------------
                _buildSection(
                  title: "Administrator",
                  items: [
                    _menuItem(Icons.person, "Users"),
                    _menuItem(Icons.shield, "Roles"),
                    _menuItem(Icons.settings, "Settings"),
                  ],
                ),

                const SizedBox(height: 100),
              ],
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
                setState(() {
                  _selectedIndex = index;
                });
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
  Widget _menuItem(IconData icon, String label) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 4 - 28, // 👉 4 per baris
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.blue.shade100.withOpacity(0.4),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              size: 24,
              color: const Color(0xff1A4892),
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
