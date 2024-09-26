import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF444444)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              const Text(
                'Forgot Password',
                style: TextStyle(
                  color: Color(0xFF444444),
                  fontSize: 24,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                'Enter Email Address',
                style: TextStyle(
                  color: Color(0xFF444444),
                  fontSize: 16,
                  fontFamily: 'Montserrat',
                ),
              ),
              const SizedBox(height: 20),
              // Email TextField
              Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: const Color(0xFF717171)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: 'example@gmail.com',
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        color: Color(0xFF8F8F8F),
                        fontSize: 14,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              // Send Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    // Logika pengiriman email reset password
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    backgroundColor: const Color(0xFFD71014),
                  ),
                  child: const Text(
                    'Send',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Back to Sign In
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Back to sign in',
                  style: TextStyle(
                    color: Color(0xFFABABAB),
                    fontSize: 14,
                    fontFamily: 'Montserrat',
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
