import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FaceIdRegistrationScreen extends StatefulWidget {
  @override
  _FaceIdRegistrationScreenState createState() => _FaceIdRegistrationScreenState();
}

class _FaceIdRegistrationScreenState extends State<FaceIdRegistrationScreen> {
  late CameraController _cameraController;
  late Future<void> _initializeControllerFuture;
  String _imagePath = '';

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    _cameraController = CameraController(
      cameras[0], // Menggunakan kamera belakang
      ResolutionPreset.high,
    );
    _initializeControllerFuture = _cameraController.initialize();
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  Future<void> _captureFaceId() async {
    try {
      await _initializeControllerFuture;
      final image = await _cameraController.takePicture();
      setState(() {
        _imagePath = image.path; // Simpan path gambar
      });

      // Simpan path ke SharedPreferences
      await _saveImagePath(_imagePath);

      // Tampilkan dialog konfirmasi
      _showConfirmationDialog();
    } catch (e) {
      print(e);
      _showErrorDialog('Terjadi kesalahan saat mengambil gambar.');
    }
  }

  Future<void> _saveImagePath(String path) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('faceIdImagePath', path); // Simpan path
  }

  Future<String?> _getImagePath() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('faceIdImagePath'); // Ambil path
  }

  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Konfirmasi'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Apakah Anda yakin ingin menyimpan gambar ini untuk registrasi?'),
              SizedBox(height: 10),
              _imagePath.isNotEmpty
                  ? Image.file(File(_imagePath), height: 100, width: 100) // Tampilkan gambar
                  : Container(),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Tutup dialog
              },
              child: Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                // // Navigasi ke halaman selanjutnya setelah registrasi
                // Navigator.pushReplacement(
                //   context,
                //   MaterialPageRoute(builder: (context) => NextScreen()), // Ganti NextScreen dengan halaman yang sesuai
                // );
              },
              child: Text('Simpan'),
            ),
          ],
        );
      },
    );
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Kesalahan'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Tutup dialog
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registrasi Face ID')),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Column(
              children: [
                Expanded(child: CameraPreview(_cameraController)),
                ElevatedButton(
                  onPressed: _captureFaceId,
                  child: Text('Ambil Foto Wajah'),
                ),
              ],
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
