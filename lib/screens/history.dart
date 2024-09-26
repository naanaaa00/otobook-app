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
      backgroundColor: Colors.transparent, // Make background transparent
      body: Column(
        children: [
           CalendarTimeline(
            initialDate: DateTime.now(),
            firstDate: DateTime(2019, 1, 15),
            lastDate: DateTime.now().add(const Duration(days: 7)),
            onDateSelected: (date) {},
            leftMargin: 20,
            monthColor: AppColors.grey,
            dayColor: AppColors.black,
            activeDayColor: Colors.white,
            activeBackgroundDayColor: AppColors.primary,
            showYears: true,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white24, // Background color for this section
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20.0), // Rounded corners at the bottom
              ),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 150, // Set a specific width for the button
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle button press for another functionality if needed
                      },
                      child: Text('Back'), // Label could be changed
                    ),
                  ),
                ),
                Spacer(), // Push the logo to the right
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
                      // child: Image.asset(
                      //   'assets/logo_oto.PNG', // Path to the PNG image in assets
                      //   height: 40,
                      // ),
                    ),
                  ),
                ),
              ],
            ),
          ),
                     CalendarTimeline(
            initialDate: DateTime.now(),
            firstDate: DateTime(2019, 1, 15),
            lastDate: DateTime.now().add(const Duration(days: 7)),
            onDateSelected: (date) {},
            leftMargin: 20,
            monthColor: AppColors.grey,
            dayColor: AppColors.black,
            activeDayColor: Colors.white,
            activeBackgroundDayColor: AppColors.primary,
            showYears: true,
          ),
            const SpaceHeight(45.0),
          const HistoryAttendance(),
          const SpaceHeight(10.0),
          const HistoryLocation(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'History Absensi Karyawan',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20.0),
                  _buildAbsensiList(), // Call the method to build the list
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
 
  // Sample method to build a list of employee absences
  Widget _buildAbsensiList() {
    // Sample data for absensi; replace with real data in practice
    List<Map<String, String>> absensiData = [
      {'tanggal': '2024-09-01', 'karyawan': 'John Doe', 'status': 'Hadir'},
      {'tanggal': '2024-09-02', 'karyawan': 'Jane Smith', 'status': 'Tidak Hadir'},
      {'tanggal': '2024-09-03', 'karyawan': 'Alice Johnson', 'status': 'Hadir'},
      // Add more entries as needed
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: absensiData.length,
      itemBuilder: (context, index) {
        final absensi = absensiData[index];
        return Card(
          margin: EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            title: Text('Karyawan: ${absensi['karyawan']}'),
            subtitle: Text('Tanggal: ${absensi['tanggal']}'),
            trailing: Text('Status: ${absensi['status']}'),
          ),
        );
      },
    );
  }
}
