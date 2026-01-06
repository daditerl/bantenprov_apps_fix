import 'package:flutter/material.dart';
import '../pages/kirimkodepage.dart';

class UbahPasswordPage extends StatefulWidget {
  const UbahPasswordPage({super.key});

  @override
  State<UbahPasswordPage> createState() => _UbahPasswordPageState();
}

class _UbahPasswordPageState extends State<UbahPasswordPage> {
  bool hideOld = true;
  bool hideNew = true;
  bool hideConfirm = true;

  final Color primaryColor = const Color(0xff1A4892);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F2F2),
      body: SafeArea(
        child: Column(
          children: [
            // ================= HEADER =================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              child: Stack(
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
                    "Ubah Password",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: primaryColor,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // ================= FORM =================
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    _passwordField(
                      label: "Kata Sandi Saat ini",
                      isHidden: hideOld,
                      onToggle: () {
                        setState(() => hideOld = !hideOld);
                      },
                    ),

                    const SizedBox(height: 30),

                    _passwordField(
                      label: "Kata Sandi Baru",
                      isHidden: hideNew,
                      onToggle: () {
                        setState(() => hideNew = !hideNew);
                      },
                    ),

                    const SizedBox(height: 30),

                    _passwordField(
                      label: "Konfirmasi Kata Sandi Baru",
                      isHidden: hideConfirm,
                      onToggle: () {
                        setState(() => hideConfirm = !hideConfirm);
                      },
                    ),

                    const SizedBox(height: 60),

                    // ================= BUTTON =================
                    InkWell(
                      borderRadius: BorderRadius.circular(16),
                      onTap: () {
                        // aksi simpan password
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 15),
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
                          "Simpan Perubahan",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: primaryColor,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const KirimKodePage(),
                          ),
                        );
                      },
                      child: const Text(
                        "Lupa Password?",
                        style: TextStyle(
                          color: Color(0xff1A4892),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),

                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ================= PASSWORD FIELD =================
  Widget _passwordField({
    required String label,
    required bool isHidden,
    required VoidCallback onToggle,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: primaryColor,
          ),
        ),
        TextField(
          obscureText: isHidden,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(
                isHidden ? Icons.visibility_off : Icons.visibility,
                color: Colors.grey,
              ),
              onPressed: onToggle,
            ),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black26),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: primaryColor),
            ),
          ),
        ),
      ],
    );
  }
}
