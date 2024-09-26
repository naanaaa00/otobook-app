import 'package:flutter/material.dart';

class DashboardKantor extends StatelessWidget {
  const DashboardKantor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard Karyawan'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildUserCard(
            username: 'user1',
            kantor: 'Kantor Utama',
            kota: 'Jakarta',
            inDatetime: '2024-09-25 08:00',
            outDatetime: '2024-09-25 17:00',
          ),
          const SizedBox(height: 10),
          _buildUserCard(
            username: 'user2',
            kantor: 'Kantor Cabang 1',
            kota: 'Surabaya',
            inDatetime: '2024-09-25 08:30',
            outDatetime: '2024-09-25 16:30',
          ),
          const SizedBox(height: 10),
          _buildUserCard(
            username: 'user3',
            kantor: 'Kantor Cabang 2',
            kota: 'Bandung',
            inDatetime: '2024-09-25 09:00',
            outDatetime: '2024-09-25 17:00',
          ),
          // Tambahkan lebih banyak kartu pengguna sesuai kebutuhan
        ],
      ),
    );
  }

  Widget _buildUserCard({
    required String username,
    required String kantor,
    required String kota,
    required String inDatetime,
    required String outDatetime,
  }) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Username: $username', style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            Text('Kantor: $kantor'),
            Text('Kota: $kota'),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('In: $inDatetime'),
                Text('Out: $outDatetime'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
