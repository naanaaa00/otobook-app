import 'package:flutter/material.dart';
import 'package:Viva/screens/search.dart';
import 'package:Viva/screens/history.dart';
import 'package:Viva/screens/setting.dart';
import 'screens/home.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  _NavigationMenuState createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    HomeScreen(), // Halaman HomeScreen dari file terpisah
    HistoryAbsensiScreen(), // Halaman lain
    SearchScreen(),
    SearchScreen(), // Halaman lain
    SettingScreen(), // Halaman lain
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
        backgroundColor: Color.fromARGB(255, 255, 255, 255), // Warna latar belakang BottomNavigationBar
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_add),
            label: 'History',
          ),
            BottomNavigationBarItem(
            icon: SizedBox.shrink(), 
            // Placeholder for scan icon
            label: '',
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
        selectedItemColor: Color.fromARGB(255, 241, 73, 73),
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed, // Menampilkan semua ikon terus-menerus
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle scan icon press
        },
        backgroundColor: Color(0xFF005CBE),
        child: Stack(
          children: [
        Icon(
          Icons.person_add,
          color: Colors.white,
          size: 30.0, // Set the icon size (default is 24.0)
        ),
          ],
        ),
        elevation: 8.0, // Shadow effect
        highlightElevation: 12.0, // Increased shadow effect on press
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.white, width: 2.0),
          borderRadius: BorderRadius.circular(28.0),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked, // Center the FAB
    );
  }
}