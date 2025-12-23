import 'package:flutter/material.dart';

class UbahPasswordV2Page extends StatefulWidget {
  const UbahPasswordV2Page({super.key});

  @override
  State<UbahPasswordV2Page> createState() => _UbahPasswordV2PageState();
}

class _UbahPasswordV2PageState extends State<UbahPasswordV2Page> {
  final Color primaryColor = const Color(0xff1A4892);

  bool hidePassword1 = true;
  bool hidePassword2 = true;

  @override
  Widget build(BuildContext context) {
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
                  "Ubah Password",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: primaryColor,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 40),

            // ================= FORM =================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _passwordField(
                    label: "Kata Sandi Baru",
                    isHidden: hidePassword1,
                    onToggle: () {
                      setState(() {
                        hidePassword1 = !hidePassword1;
                      });
                    },
                  ),
                  const SizedBox(height: 30),
                  _passwordField(
                    label: "Konfirmasi Kata Sandi Baru",
                    isHidden: hidePassword2,
                    onToggle: () {
                      setState(() {
                        hidePassword2 = !hidePassword2;
                      });
                    },
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
                  // aksi simpan password baru
                },
                child: Container(
                  width: 240,
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
                    "Simpan Perubahan",
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
        const SizedBox(height: 6),
        TextField(
          obscureText: isHidden,
          decoration: InputDecoration(
            isDense: true,
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black26),
            ),
            suffixIcon: IconButton(
              icon: Icon(
                isHidden ? Icons.visibility_off : Icons.visibility,
                color: Colors.grey,
              ),
              onPressed: onToggle,
            ),
          ),
        ),
      ],
    );
  }
}
