import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import '../../../core/core.dart';
import 'package:Viva/screens/location_page.dart';

class HistoryLocation extends StatefulWidget {
  const HistoryLocation({super.key});

  @override
  _HistoryLocationState createState() => _HistoryLocationState();
}

class _HistoryLocationState extends State<HistoryLocation> {
  String latitude = 'Memuat...';
  String longitude = 'Memuat...';
  String status = 'Tidak Diketahui';
  
  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  // Method to get current location using Geolocator
  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled, request the user to enable them
      setState(() {
        status = 'Layanan lokasi dinonaktifkan';
      });
      return;
    }

    // Check for location permission
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        // Permissions are denied forever, handle accordingly
        setState(() {
          status = 'Izin lokasi ditolak secara permanen';
        });
        return;
      }
      if (permission == LocationPermission.denied) {
        // Permissions are denied, handle accordingly
        setState(() {
          status = 'Izin lokasi ditolak';
        });
        return;
      }
    }

    // If permissions are granted, get the position
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    setState(() {
      latitude = position.latitude.toString();
      longitude = position.longitude.toString();
      status = 'Sesuai spot Absensi'; // You can adjust based on your own logic
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Assets.icons.location.svg(),
              const SpaceWidth(8.0),
              const Text(
                'Kantor',
                style: TextStyle(
                  fontSize: 16.0,
                  color: AppColors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SpaceHeight(4.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Status',
                style: TextStyle(
                  color: AppColors.white,
                ),
              ),
              Text(
                status,
                style: const TextStyle(
                  color: AppColors.white,
                ),
              ),
            ],
          ),
          const SpaceHeight(4.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Longitude',
                style: TextStyle(
                  color: AppColors.white,
                ),
              ),
              Text(
                longitude,
                style: const TextStyle(
                  color: AppColors.white,
                ),
              ),
            ],
          ),
          const SpaceHeight(4.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Latitude',
                style: TextStyle(
                  color: AppColors.white,
                ),
              ),
              Text(
                latitude,
                style: const TextStyle(
                  color: AppColors.white,
                ),
              ),
            ],
          ),
          const SpaceHeight(12.0),
          Button.filled(
            color: AppColors.white.withOpacity(0.5),
            onPressed: () {
              context.push(const LocationPage());
            },
            label: 'Lihat di Peta',
            fontSize: 14.0,
            height: 40.0,
          ),
        ],
      ),
    );
  }
}
