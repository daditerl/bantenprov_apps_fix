import 'package:flutter/material.dart';
import 'homepage.dart'; // pastikan file ini sudah ada

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  double _initialY = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onVerticalDragStart: (details) {
        _initialY = details.localPosition.dy;
      },
      onVerticalDragUpdate: (details) {
        // Jika usapan ke atas lebih dari 100px
        if (_initialY - details.localPosition.dy > 100) {
          _navigateToHome(context);
        }
      },
      child: Scaffold(
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // 🔹 Background gambar full fit
              Positioned.fill(
                child: Image.asset(
                  'assets/images/Background_Banten.png', // ubah sesuai file kamu
                  fit: BoxFit.cover,
                ),
              ),

              // 🔹 Konten utama (logo & teks)
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),

                  // Logo Umah Banten — responsif dengan ukuran layar
                  Image.asset(
                    'assets/images/LogoUmah_Banten.png',
                    width: size.width * 0.5, // lebar proporsional
                    fit: BoxFit.contain,
                  ),

                  const Spacer(),

                  // Teks instruksi
                  Text(
                    'Usap untuk mengakses\naplikasi ini',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.blueGrey.shade900,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Panah ke bawah
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.blueGrey.shade900,
                    size: 30,
                  ),

                  const SizedBox(height: 70),
                ],
              ),

              // 🔹 Kotak putih bawah (full width)
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  width: size.width,
                  height: 60,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Fungsi navigasi ke HomePage dengan animasi slide ke atas
  void _navigateToHome(BuildContext context) {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 600),
        pageBuilder: (context, animation, secondaryAnimation) =>
            const HomePage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final offsetAnimation = Tween(
            begin: const Offset(0, 1),
            end: Offset.zero,
          ).animate(CurvedAnimation(
            parent: animation,
            curve: Curves.easeOutCubic,
          ));
          return SlideTransition(position: offsetAnimation, child: child);
        },
      ),
    );
  }
}
