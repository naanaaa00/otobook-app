import 'package:flutter/material.dart';
import 'package:Viva/screens/super_admin/add_user.dart';
import 'package:Viva/screens/super_admin/view_user.dart';
import 'package:Viva/screens/signin.dart'; // Import your login page
import 'package:shared_preferences/shared_preferences.dart'; // Import shared preferences for logout
import '../../../core/core.dart'; // Import your core styles

class NavigationSuperAdmin extends StatelessWidget {
  const NavigationSuperAdmin({super.key});

  Future<void> _logout(BuildContext context) async {
    // Clear any stored data in SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // Clear all stored preferences

    // Navigate to the login screen
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => SignIn()),
      (route) => false, // Remove all previous routes
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home Super Admin',
          style: TextStyle(color: AppColors.white), // Apply core text style
        ),
        backgroundColor: AppColors.primary, // Use primary color from core
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
            onPressed: () => _logout(context), // Call logout function
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0), // Add padding to the body
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255), // Background color from core
        ),
        child: const Center(
          child: Text(
            'Welcome Super Admin',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: AppColors.primary, 
             // Apply core text color
            ),
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddUserPage()),
              );
            },
            child: const Icon(Icons.add),
            tooltip: 'Add User',
            backgroundColor: AppColors.secondary, // Use secondary color from core
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ViewUsersPage()),
              );
            },
            child: const Icon(Icons.list),
            tooltip: 'View Users',
            backgroundColor: AppColors.secondary, // Use secondary color from core
          ),
        ],
      ),
    );
  }
}
