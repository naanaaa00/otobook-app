import 'package:flutter/material.dart';
// Import your actual page files
// Adjust the import path as needed
import 'package:Viva/screens/assign.dart'; // Adjust the import path as needed
import 'package:Viva/screens/izin.dart'; // Adjust the import path as needed
import 'package:Viva/screens/kantor.dart'; // Adjust the import path as needed

class IconRowWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 369,
      height: 103,
      padding:
          const EdgeInsets.symmetric(horizontal: 22), // Padding for spacing
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween, // Evenly spaces items
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // buildIconColumn(context, 'Cover', Icons.book, Color(0xFF4894FE), CoverScannerScreen()),
          buildIconColumn(context, 'Jadwal', Icons.schedule,
              Color(0xFF4894FE), AssignSchedule()),
          buildIconColumn(context, 'Izin', Icons.assessment, Color(0xFF4894FE),
             IzinKaryawanPage()),
          buildIconColumn(context, 'Kantor', Icons.local_post_office, Color(0xFF4894FE),
              DashboardKantor()),
        ],
      ),
    );
  }

  Widget buildIconColumn(BuildContext context, String text, IconData icon,
      Color color, Widget page) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: ShapeDecoration(
              color: Color(0xFFFAFAFA),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
              shadows: [
                BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 4,
                  offset: Offset(0, 4),
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Icon(
              icon,
              size: 24,
              color: color, // Applying the color
            ),
          ),
          const SizedBox(height: 8),
          Text(
            text,
            style: TextStyle(
              color: Color(0xFF8696BB),
              fontSize: 15,
              fontFamily: 'Poppins',
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}