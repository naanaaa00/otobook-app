import 'package:flutter/material.dart';

class IzinKaryawanPage extends StatelessWidget {
  const IzinKaryawanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Monitoring Izin Karyawan'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildIzinCard(
            context,
            datetimeAwal: '2024-09-01 09:00',
            datetimeAkhir: '2024-09-01 17:00',
            alasan: 'Sakit',
            foto: 'assets/start.png', // Ganti dengan foto yang sesuai
            statusApprove: [true, true, false, false, true],
          ),
          const SizedBox(height: 10),
          _buildIzinCard(
            context,
            datetimeAwal: '2024-09-10 09:00',
            datetimeAkhir: '2024-09-10 17:00',
            alasan: 'Cuti Tahunan',
            foto: 'assets/example_photo.png', // Ganti dengan foto yang sesuai
            statusApprove: [true, false, false, false, false],
          ),
          // Tambahkan lebih banyak kartu izin sesuai kebutuhan
        ],
      ),
    );
  }

  Widget _buildIzinCard(
    BuildContext context, {
    required String datetimeAwal,
    required String datetimeAkhir,
    required String alasan,
    required String foto,
    required List<bool> statusApprove,
  }) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Tanggal Awal: $datetimeAwal'),
            Text('Tanggal Akhir: $datetimeAkhir'),
            Text('Alasan: $alasan'),
            const SizedBox(height: 10),
            Image.asset(foto, height: 100), // Menampilkan foto
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(statusApprove.length, (index) {
                return Column(
                  children: [
                    Text('Approve ${index + 1}'),
                    Icon(
                      statusApprove[index] ? Icons.check : Icons.close,
                      color: statusApprove[index] ? Colors.green : Colors.red,
                    ),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
