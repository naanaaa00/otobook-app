import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:Viva/navigation_hr.dart';
import 'package:Viva/navigation_spg.dart';
import 'package:Viva/navigation_superadmin.dart';
import 'package:Viva/screens/signin.dart';



class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  @override
  void initState() {
    super.initState();
    getToken();
  }

  Future<void> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    String? role = prefs.getString('role'); // Peran pengguna (SPG, HR, atau Super Admin)

    print('Token: $token');
    print('Role: $role');

    if (token != null && token.isNotEmpty && role != null && role.isNotEmpty) {
      // Token dan role ada, arahkan ke halaman berdasarkan peran pengguna
      navigateToRolePage(role);
    } else {
      // Token tidak ada atau tidak valid, arahkan ke halaman login
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) =>  SignIn()),
      );
    }
  }

  void navigateToRolePage(String role) {
    if (role == 'superadmin') {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const NavigationSuperAdmin()),
      );
    } else if (role == 'admin') {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const NavigationMenu()),
      );
    } else{
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const NavigationSpg()),
      );
    } ;
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child:
            CircularProgressIndicator(), // Tampilkan loader sementara menunggu navigasi
      ),
    );
  }
}
