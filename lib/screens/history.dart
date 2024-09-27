import 'package:flutter/material.dart';
import 'package:Viva/screens/start.dart';
import 'package:Viva/widgets/history_attendance.dart';
import 'package:Viva/widgets/history_location.dart';
import 'package:calendar_timeline/calendar_timeline.dart';

import '../core/core.dart';

class HistoryAbsensiScreen extends StatelessWidget {
  const HistoryAbsensiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // Membuat latar belakang transparan
      body: Column(
        children: [
          SizedBox(height: 20.0),
          
          CalendarTimeline(
            initialDate: DateTime.now(),
            firstDate: DateTime(2019, 1, 15),
            lastDate: DateTime.now().add(const Duration(days: 7)),
            onDateSelected: (date) {
              // Anda bisa menambahkan logika ketika tanggal dipilih
            },
            leftMargin: 20,
            monthColor: AppColors.grey,
            dayColor: AppColors.black,
            activeDayColor: Colors.white,
            activeBackgroundDayColor: AppColors.primary,
            showYears: true,
          ),
          
          // Container for back button and logo
          Container(
            decoration: BoxDecoration(
              color: Colors.white24, // Warna latar untuk section ini
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20.0), // Rounded corners pada bagian bawah
              ),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 150, // Set ukuran khusus untuk tombol
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context); // Navigasi ke halaman sebelumnya
                      },
                      child: Text('Back'), // Label tombol
                    ),
                  ),
                ),
                Spacer(), // Mendorong logo ke kanan
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => StartScreen()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      // Uncomment and use if logo is needed
                      // child: Image.asset(
                      //   'assets/logo_oto.PNG', // Path gambar PNG pada assets
                      //   height: 40,
                      // ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // Contoh penggunaan ListView untuk menampilkan riwayat absensi
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16),
              children: const [
                HistoryAttendance(), // Widget custom untuk riwayat absensi
                SizedBox(height: 10),
                HistoryLocation(), // Widget custom untuk riwayat lokasi
              ],
            ),
          ),
        ],
      ),
    );
  }
}
