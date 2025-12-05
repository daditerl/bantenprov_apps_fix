import 'package:flutter/material.dart';

class TataKelolaPage extends StatelessWidget {
  const TataKelolaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tata Kelola"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: const Center(
        child: Text(
          "Selamat Datang di Halaman Tata Kelola",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
