import 'package:flutter/material.dart';
// Ensure this import is correct
import 'package:Viva/navigation.dart'; // Ensure this import is correct
import 'package:Viva/screens/forgot_password.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _obscureText = true; // Added for password visibility toggle

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color.fromARGB(255, 176, 176, 176)), // Changed color to match theme
          onPressed: () {
            Navigator.pop(context); // Navigate back when pressed
          },
        ),
        title: Text(
          'Sign In',
          style: TextStyle(
            color: Color(0xFFF53C8F),
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.10,
          ),
        ),
        centerTitle: true,
        toolbarHeight: 79,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              width: double.infinity,
              child: Opacity(
                opacity: 0.50,
                child: Text(
                  'Sign up now Viva Cosmetics Attendance',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF111827),
                    fontSize: 14,
                    fontFamily: 'Montserrat',
                    height: 1.5,
                    letterSpacing: 0.07,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20), // Spacing
            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: InputBorder.none,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: TextFormField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: InputBorder.none,
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureText ? Icons.visibility_off : Icons.visibility,
                            color: Color.fromARGB(255, 172, 170, 170),
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                      ),
                      obscureText: _obscureText,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ForgotPasswordPage(),
                    ),
                  );
                },
                      child: Text(
                        'Forget Password?',
                        style: TextStyle(
                          color: Color(0xFFF53C8F),
                          fontSize: 12,
                          fontFamily: 'Montserrat',
                          letterSpacing: 0.07,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NavigationMenu()), // Navigate to NavigationMenu
                      );
                    },
                    child: Text(
                      'Sign In',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFD71014), // Button color
                      minimumSize: Size(double.infinity, 50), // Button size
                    ),
                  ),
               
                  SizedBox(height: 20),
                
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
