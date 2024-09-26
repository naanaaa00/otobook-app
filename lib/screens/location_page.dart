import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import '../../../core/core.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  String _location = 'Memuat lokasi...';
  bool _isLoading = true;
  late final MapController _mapController;
  LatLng _currentLatLng = LatLng(-6.200000, 106.816666); // Koordinat Jakarta sebagai default

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Cek apakah service GPS aktif
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() {
        _location = 'Layanan lokasi dinonaktifkan.';
        _isLoading = false;
      });
      return;
    }

    // Cek izin untuk menggunakan lokasi
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() {
          _location = 'Izin lokasi ditolak.';
          _isLoading = false;
        });
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      setState(() {
        _location = 'Izin lokasi ditolak secara permanen.';
        _isLoading = false;
      });
      return;
    }

    // Ambil posisi saat ini
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    // Ambil alamat berdasarkan koordinat
    _getAddressFromLatLng(position);
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark place = placemarks[0];

      setState(() {
        _location = '${place.street}, ${place.locality}, ${place.postalCode}, ${place.country}';
        _isLoading = false;
        _currentLatLng = LatLng(position.latitude, position.longitude); // Set koordinat saat ini

        // Pindahkan peta ke posisi saat ini
        _mapController.move(_currentLatLng, 13.0);
      });
    } catch (e) {
      setState(() {
        _location = 'Gagal mendapatkan lokasi: $e';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Menampilkan peta OpenStreetMap
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              onTap: (tapPosition, point) {
                setState(() {
                  _currentLatLng = point;
                });
              },
              minZoom: 13.0,
            ),
            children: [
              TileLayer(
                urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: ['a', 'b', 'c'],
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    width: 80.0,
                    height: 80.0,
                    point: _currentLatLng, // Gunakan koordinat saat ini
                    child: const Icon(
                      Icons.location_pin,
                      color: Colors.red,
                      size: 40.0,
                    ),
                     // Add this line
                  ),
                ],
              ),
            ],
          ),
          // Button kembali di atas gambar
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 50.0,
            ),
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Assets.icons.back.svg(),
            ),
          ),
          // Menampilkan lokasi
          _isLoading
              ? const Center(child: CircularProgressIndicator())
              : Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: Text(
                        'Lokasi Anda: $_location',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
