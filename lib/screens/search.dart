import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<String> karyawanList = [
    'John Doe',
    'Jane Smith',
    'Alice Johnson',
    'Bob Brown',
    // Tambahkan nama karyawan lain di sini
  ];
  List<String> filteredKaryawanList = [];

  @override
  void initState() {
    super.initState();
    filteredKaryawanList = karyawanList; // Inisialisasi dengan semua karyawan
  }

  void _filterKaryawan(String query) {
    final filtered = karyawanList.where((karyawan) {
      return karyawan.toLowerCase().contains(query.toLowerCase());
    }).toList();

    setState(() {
      filteredKaryawanList = filtered;
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(144, 255, 255, 255), // Background color
      appBar: AppBar(
        title: Text('Cari Karyawan'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Masukkan nama karyawan',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: _filterKaryawan,
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: filteredKaryawanList.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: Text(filteredKaryawanList[index]),
                      onTap: () {
                        // Tindakan saat nama karyawan dipilih
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
