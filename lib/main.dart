import 'package:bantenprov_apps/pages/kalenderpage.dart';
import 'package:flutter/material.dart';

import 'tatakelola.dart';
import 'landingpage.dart';
import 'layananpublikpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LandingPage(),
      routes: {
        '/tatakelola': (context) => const TataKelolaPage(),
        '/layananpublikpage': (context) => const LayananPublikPage(),
        '/kalenderpage': (context) => const KalenderPage(),
      },
    );
  }
}
