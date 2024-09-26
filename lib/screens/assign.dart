import 'package:flutter/material.dart';

class AssignSchedule extends StatefulWidget {
  const AssignSchedule({Key? key}) : super(key: key);

  @override
  _AssignScheduleState createState() => _AssignScheduleState();
}

class _AssignScheduleState extends State<AssignSchedule> {
  String selectedUser = '';
  DateTime selectedDate = DateTime.now();
  TimeOfDay startTime = TimeOfDay.now();
  TimeOfDay endTime = TimeOfDay.now();
  String selectedShift = 'Shift 1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Penjadwalan Karyawan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildSearchField(),
            const SizedBox(height: 20),
            _buildDatePicker(),
            const SizedBox(height: 20),
            _buildTimePicker(),
            const SizedBox(height: 20),
            _buildShiftSelector(),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Logika untuk menyimpan jadwal
                _saveSchedule();
              },
              child: const Text('Tetapkan Jadwal'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchField() {
    return TextField(
      onChanged: (value) {
        setState(() {
          selectedUser = value; // Simpan input pengguna untuk pencarian
        });
      },
      decoration: InputDecoration(
        labelText: 'Cari Karyawan',
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _buildDatePicker() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Tanggal: ${selectedDate.toLocal()}'.split(' ')[0]),
        ElevatedButton(
          onPressed: () async {
            final DateTime? picked = await showDatePicker(
              context: context,
              initialDate: selectedDate,
              firstDate: DateTime(2000),
              lastDate: DateTime(2101),
            );
            if (picked != null && picked != selectedDate) {
              setState(() {
                selectedDate = picked;
              });
            }
          },
          child: const Text('Pilih Tanggal'),
        ),
      ],
    );
  }

  Widget _buildTimePicker() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Waktu Awal:'),
            ElevatedButton(
              onPressed: () async {
                final TimeOfDay? picked = await showTimePicker(
                  context: context,
                  initialTime: startTime,
                );
                if (picked != null && picked != startTime) {
                  setState(() {
                    startTime = picked;
                  });
                }
              },
              child: Text(startTime.format(context)),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Waktu Akhir:'),
            ElevatedButton(
              onPressed: () async {
                final TimeOfDay? picked = await showTimePicker(
                  context: context,
                  initialTime: endTime,
                );
                if (picked != null && picked != endTime) {
                  setState(() {
                    endTime = picked;
                  });
                }
              },
              child: Text(endTime.format(context)),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildShiftSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Pilih Shift:'),
        DropdownButton<String>(
          value: selectedShift,
          onChanged: (String? newValue) {
            setState(() {
              selectedShift = newValue!;
            });
          },
          items: <String>['Shift 1', 'Shift 2', 'Shift 3']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ],
    );
  }

  void _saveSchedule() {
    // Implementasi logika untuk menyimpan jadwal
    final scheduleDetails = {
      'user': selectedUser,
      'date': selectedDate,
      'startTime': startTime.format(context),
      'endTime': endTime.format(context),
      'shift': selectedShift,
    };

    // Tampilkan hasil di console atau simpan ke database
    print('Jadwal disimpan: $scheduleDetails');
  }
}
