import 'package:Viva/services/auth_gate.dart';
import 'package:flutter/material.dart';




class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/start.png',
                width: MediaQuery.of(context).size.width,
                height: 180,
              ),
              const SizedBox(height: 20),
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                      child: Text(
                        'Viva Attendance adalah Aplikasi Absensi Online untuk Sales Counter Viva Cosmetics',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16),
                      ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  AuthGate(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFD61013), // Warna background tombol
                    minimumSize: const Size(double.infinity, 50), // Lebar penuh
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // Sudut membulat
                    ),
                    elevation: 5, // Memberikan bayangan/efek 3D
                    shadowColor: Colors.black.withOpacity(0.3), // Warna bayangan
                  ),
                  child: const Text(
                    'Masuk',
                    style: TextStyle(
                      color: Colors.white, // Warna teks putih
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
