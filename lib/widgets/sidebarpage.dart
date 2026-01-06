import 'package:bantenprov_apps/loginpage.dart';
import 'package:flutter/material.dart';
import '../pages/profilepage.dart';

class SidebarPage extends StatefulWidget {
  const SidebarPage({super.key});

  @override
  State<SidebarPage> createState() => _SidebarPageState();
}

class _SidebarPageState extends State<SidebarPage> {
  final Color primaryColor = const Color(0xff1A4892);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xffF6F6F6),
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // ================= PROFILE CARD =================
            InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () {
                Navigator.pop(context); // tutup drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfilePage(),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    )
                  ],
                ),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 26,
                      backgroundImage: AssetImage(
                        'assets/images/jonggunpark.jpeg',
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Fardan',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'Mentor Kadin',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.person, color: primaryColor),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // ================= EXPANSION MENU =================
            _expansionTile(
              "Profil Provinsi",
              [
                "Sejarah Banten",
                "Geografi",
                "Demografi",
                "Arti Lambang",
                "Kebudayaan",
              ],
            ),

            _expansionTile(
              "Profil Pemerintah",
              [
                "Profil Pimpinan dan Pegawai",
                "Visi dan Misi Provinsi Banten",
                "Struktur Organisasi",
                "Organisasi Perangkat Daerah (OPD)",
                "Laporan Harta Kekayaan Pejabat Negara (LHKPN)",
              ],
            ),

            _expansionTile(
              "Layanan dan Informasi Publik",
              [
                "Informasi pelanggaran dan laporan penindakan",
                "Layanan Publik",
                "Informasi Publik",
                "Daftar Informasi Publik",
                "Permohonan Informasi",
                "Keberatan Informasi Publik",
                "Standar Pengumuman Informasi",
              ],
            ),

            _expansionTile(
              "Berita Update",
              [
                "Press Release",
                "Gallery Video",
                "Artikel",
              ],
            ),

            _expansionTile(
              "Pengumuman",
              [],
            ),

            _expansionTile(
              "SAKIP",
              [
                "2023",
                "2024",
              ],
            ),

            _expansionTile(
              "IPKD",
              [
                "Pedoman SAKIP",
                "RPJPD",
                "RPJMD",
                "RKPD",
                "LPPD",
                "LKPD",
                "PERKIN GUBERNUR",
                "Indikator Kinerja Utama (IKU)",
                "Pengadaan Barang dan Jasa Strategis",
              ],
            ),

            const SizedBox(height: 24),
            Divider(color: primaryColor.withOpacity(0.4)),
            const SizedBox(height: 16),

            // ================= BOTTOM MENU =================
            _bottomMenu(
              icon: Icons.account_circle_outlined,
              title: "Informasi Akun",
              subtitle: "Informasi lengkap tentang akun anda",
              onTap: () {},
            ),
            _bottomMenu(
              icon: Icons.settings_outlined,
              title: "Pengaturan",
              subtitle: "Penyesuaian untuk penggunaan anda",
              onTap: () {},
            ),
            _bottomMenu(
              icon: Icons.help_outline,
              title: "Sering Ditanyakan",
              subtitle: "Pertanyaan yang sering ditanyakan",
              onTap: () {},
            ),
            _bottomMenu(
              icon: Icons.logout,
              title: "Keluar Akun",
              subtitle: "Keluar akun dari aplikasi",
              isLogout: true,
              onTap: () {
                Navigator.pop(context); // ✅ tutup drawer
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // ================= EXPANSION TILE =================
  Widget _expansionTile(
    String title,
    List<String> items,
  ) {
    final bool hasChildren = items.isNotEmpty;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 8,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: ExpansionTile(
        title: Text(
          title,
          style: TextStyle(
            color: primaryColor,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),

        // ⬇️ INI KUNCINYA
        trailing: hasChildren
            ? Icon(Icons.expand_more, color: primaryColor)
            : const SizedBox.shrink(),

        children: hasChildren
            ? items
                .map(
                  (item) => ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    dense: true,
                    title: Text(
                      item,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey.shade800,
                      ),
                    ),
                    leading: const Icon(
                      Icons.circle,
                      size: 6,
                      color: Colors.grey,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                )
                .toList()
            : [],
      ),
    );
  }

  // ================= BOTTOM MENU ITEM =================
  Widget _bottomMenu({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    bool isLogout = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 8,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue.shade50,
          child: Icon(
            icon,
            color: isLogout ? Colors.red : primaryColor,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: isLogout ? Colors.red : Colors.black87,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(fontSize: 11),
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}
