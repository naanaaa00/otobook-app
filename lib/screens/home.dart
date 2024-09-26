import 'package:flutter/material.dart';
import 'package:Viva/screens/start.dart';
import 'package:Viva/widgets/absensi.dart'; // Pastikan ini benar
import 'package:Viva/widgets/button_card.dart';
import '../../../core/core.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Greeting and logo section
            Container(
              decoration: BoxDecoration(
                color: Colors.white24, // Background color for this section
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(20.0), // Rounded corners at the bottom
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => StartScreen()),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16.0),
                        child: const Text(
                          'Logo Here', // Ganti dengan logo Anda
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  // Tambahkan ikon atau widget lain di sini jika perlu
                ],
              ),
            ),
            const SizedBox(height: 30.0),
            IconRowWidget(),
            const SizedBox(height: 30.0),
            AttendanceWidget(), // Memanggil AttendanceWidget di bawah IconRowWidget
            const SizedBox(height: 20),
            _buildImageWithText('assets/example_image.png', 'Contoh Gambar'), // Ganti dengan path yang sesuai
          ],
        ),
      ),
    );
  }

  Widget _buildImageWithText(String imagePath, String text) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0), // Space between images
      width: MediaQuery.of(context).size.width * 0.9, // Reduced width of the image
      height: 120, // Adjust height to make image smaller
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0), // Rounded corners
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              imagePath, // Path to the PNG image
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 8, // Position text inside the image
              left: 8,
              right: 8,
              child: Text(
                text, // Text inside the image
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14, // Adjust font size as needed
                  fontWeight: FontWeight.bold,
                  backgroundColor: Colors.black54, // Optional background for better readability
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
