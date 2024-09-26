import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Import the SVG package
import 'package:Viva/screens/start.dart'; // Adjust the import according to your file structure

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Delay to navigate to the StartScreen
    Future.delayed(
      const Duration(seconds: 2),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const StartScreen()),
      ),
    );

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Center the content vertically
        children: [
          SvgPicture.asset(
            'assets/Splash_viva.svg', // Load your SVG asset
            height: 200, // Set a height for the SVG
          ),
          const SizedBox(height: 60), // Space between the SVG and the bottom
          const Spacer(), // Spacer to push content to the top
        ],
      ),
    );
  }
}
