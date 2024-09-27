import 'dart:convert';
import 'dart:io';
import 'package:Viva/services/api.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import '../../../core/core.dart'; // Pastikan untuk import sesuai dengan struktur folder project Anda

class EdituserPage extends StatefulWidget {
  final int id; // ID dari pengguna yang akan diedit
  const EdituserPage({super.key, required this.id});

  @override
  State<EdituserPage> createState() => _EdituserPageState();
}

class _EdituserPageState extends State<EdituserPage> {
  final ImagePicker _picker = ImagePicker();
  late TextEditingController _usernameController;
  late TextEditingController _emailController;
  XFile? _profileImage;
  File? _profileImageFile;
  bool _isLoading = false;
  String? _profileImageUrl;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _emailController = TextEditingController();

    _fetchUserDetails(); // Mengambil data pengguna saat halaman dibuka
  }

  Future<void> _fetchUserDetails() async {
    setState(() {
      _isLoading = true;
    });
    try {
      final response = await http.get(Uri.parse('${GetData().getUserIdUrl}/${widget.id}'));
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        _usernameController.text = data['username'];
        _emailController.text = data['email'];
        _profileImageUrl = '${GetData().Url}${data['path']}'; // URL untuk gambar profil yang sudah ada
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to fetch user details')),
        );
      }
    } catch (e) {
      print('Error fetching user details: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _updateUser() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final uri = Uri.parse('${GetData().getUserIdUrl}/${widget.id}');
      final request = http.MultipartRequest('PUT', uri);

      // Tambahkan field username dan email
      request.fields['username'] = _usernameController.text;
      request.fields['email'] = _emailController.text;

      // Tambahkan gambar profil jika ada
      if (_profileImageFile != null) {
        request.files.add(await http.MultipartFile.fromPath(
          'file', // Field untuk gambar pada server
          _profileImageFile!.path,
        ));
      }

      final response = await request.send();
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('User updated successfully')),
        );
        Navigator.pop(context, true); // Kembali ke halaman profil setelah sukses
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to update User')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _pickProfileImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _profileImageFile = File(pickedFile.path); // Menyimpan gambar yang dipilih
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No image selected.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: _pickProfileImage, // Fungsi untuk memilih gambar profil
                      child: CircleAvatar(
                        radius: 60,
                        backgroundImage: _profileImageFile != null
                            ? FileImage(_profileImageFile!) // Jika ada gambar baru
                            : _profileImageUrl != null
                                ? NetworkImage(_profileImageUrl!) // Gambar profil dari server
                                : const AssetImage('assets/profile_placeholder.jpg') as ImageProvider,
                        backgroundColor: const Color.fromARGB(255, 82, 64, 64),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    TextField(
                      controller: _usernameController,
                      decoration: const InputDecoration(
                        labelText: 'Username',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    TextField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: _updateUser, // Fungsi untuk memperbarui data pengguna
                      child: const Text('Update User'),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
