import 'package:flutter/material.dart';
import '../pages/ubahpasswordv2page.dart';

class KirimKodePage extends StatelessWidget {
  const KirimKodePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = const Color(0xff1A4892);

    return Scaffold(
      backgroundColor: const Color(0xffF2F2F2),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 12),

            // ================= HEADER =================
            Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                Text(
                  "Lupa Password",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: primaryColor,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // ================= CONTENT =================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Masukan email atau nomer telpon Anda yang terdaftar "
                    "untuk menerima kode verifikasi",
                    style: TextStyle(
                      fontSize: 14,
                      color: primaryColor,
                    ),
                  ),

                  const SizedBox(height: 32),

                  // ================= INPUT =================
                  Text(
                    "Email atau Nomer Telpon",
                    style: TextStyle(
                      fontSize: 13,
                      color: primaryColor,
                    ),
                  ),
                  const SizedBox(height: 6),
                  TextField(
                    decoration: InputDecoration(
                      isDense: true,
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black26),
                      ),
                      suffixIcon: Icon(
                        Icons.alternate_email,
                        color: primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const Spacer(),

            // ================= BUTTON =================
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const UbahPasswordV2Page(),
                    ),
                  );
                },
                child: Container(
                  width: 220,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color(0xff8BB7D8),
                        Color(0xffDCEBF5),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Text(
                    "Kirim Kode",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: primaryColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
