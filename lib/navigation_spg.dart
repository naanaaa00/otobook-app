import 'package:flutter/material.dart';
import 'package:Viva/screens/search.dart';
import 'package:Viva/screens/history.dart';
import 'package:Viva/screens/setting.dart';
import 'package:Viva/screens/home_spg.dart'; // Halaman home khusus SPG

class NavigationSpg extends StatefulWidget {
  const NavigationSpg({super.key});

  @override
  _NavigationSpgState createState() => _NavigationSpgState();
}

class _NavigationSpgState extends State<NavigationSpg> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    HomeSpgPage(), // Halaman Home khusus SPG
    HistoryAbsensiScreen(), // Riwayat Absensi
    SearchScreen(), // Pencaria
    SettingScreen(), // Pengaturan
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Display the selected widget
          _widgetOptions[_selectedIndex],
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_add),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Setting',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 73, 177, 241),
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed, // Menampilkan semua ikon terus-menerus
      ),
      
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked, // Center the FAB
    );
  }
}
