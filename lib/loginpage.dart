import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
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
          // Background responsif & full screen
          Positioned.fill(
            child: Image.asset(
              "assets/images/bglogin.png",
              fit: BoxFit.cover,
            ),
          ),

          SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                double topPadding =
                    height * 0.12; // responsif terhadap tinggi layar

                return SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.07, // responsif kiri-kanan
                      vertical: topPadding,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Logo responsif
                        Image.asset(
                          "assets/images/logoUmahBantenpolos.png",
                          height: height * 0.11,
                        ),

                        SizedBox(height: height * 0.03),

                        // Card Form
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(width * 0.05),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.10),
                                blurRadius: 15,
                                offset: const Offset(0, 6),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Masuk Akun",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff1A4892),
                                ),
                              ),
                              SizedBox(height: height * 0.01),
                              Container(
                                height: 1.3,
                                color: Colors.indigo,
                              ),
                              SizedBox(height: height * 0.02),
                              const Text(
                                "NIP / Email",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13,
                                ),
                              ),
                              SizedBox(height: height * 0.01),
                              TextField(
                                decoration: InputDecoration(
                                  hintText: "321321/abcdef@bantenprov.go.id",
                                  hintStyle:
                                      const TextStyle(color: Colors.grey),
                                  filled: true,
                                  fillColor: Colors.grey.shade200,
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: height * 0.017,
                                    horizontal: width * 0.03,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                              SizedBox(height: height * 0.02),
                              const Text(
                                "Password",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13,
                                ),
                              ),
                              SizedBox(height: height * 0.01),
                              TextField(
                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText: "Setidaknya 8 Karakter",
                                  hintStyle:
                                      const TextStyle(color: Colors.grey),
                                  filled: true,
                                  fillColor: Colors.grey.shade200,
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: height * 0.017,
                                    horizontal: width * 0.03,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                              SizedBox(height: height * 0.03),
                              Center(
                                child: SizedBox(
                                  width: width * 0.4,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, '/tatakelola');
                                    },
                                    style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.symmetric(
                                        vertical: height * 0.017,
                                      ),
                                      backgroundColor: const Color(0xff1A76D1),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                    child: const Text(
                                      "Masuk",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: height * 0.015),
                              Center(
                                child: Text(
                                  "Lupa Password?",
                                  style: TextStyle(
                                    color: Colors.indigo.shade600,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: height * 0.1),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
