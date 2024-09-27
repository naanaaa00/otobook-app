import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import '../../../core/core.dart';
import 'package:Viva/screens/attendance_succes_page.dart';
import 'package:Viva/screens/location_page.dart';

class AbsensiPulangPage extends StatefulWidget {
  const AbsensiPulangPage({super.key});

  @override
  State<AbsensiPulangPage> createState() => _AbsensiPulangPageState();
}

class _AbsensiPulangPageState extends State<AbsensiPulangPage> {
  List<CameraDescription>? _availableCameras;
  CameraController? _controller;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  void _initializeCamera() async {
    _availableCameras = await availableCameras();
    _initCamera(_availableCameras!.first);
  }

  void _initCamera(CameraDescription description) async {
    _controller = CameraController(description, ResolutionPreset.max);
    await _controller!.initialize();
    if (!mounted) return;
    setState(() {});
  }

  void _takePicture() async {
    final image = await _controller!.takePicture();
    if (mounted) {
      // Kirim gambar ke backend untuk verifikasi dan absensi pulang
      context.pushReplacement(const AttendanceSuccessPage());
    }
  }

  void _reverseCamera() {
    final lensDirection = _controller!.description.lensDirection;
    CameraDescription newDescription;
    if (lensDirection == CameraLensDirection.front) {
      newDescription = _availableCameras!.firstWhere(
        (description) => description.lensDirection == CameraLensDirection.back,
      );
    } else {
      newDescription = _availableCameras!.firstWhere(
        (description) => description.lensDirection == CameraLensDirection.front,
      );
    }
    _initCamera(newDescription);
  }

  @override
  Widget build(BuildContext context) {
    if (_controller == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          AspectRatio(
            aspectRatio: context.deviceWidth / context.deviceHeight,
            child: CameraPreview(_controller!),
          ),
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.47),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Absensi Pulang',
                            style: TextStyle(
                              color: AppColors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            'Kantor',
                            style: TextStyle(
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          context.push(const LocationPage());
                        },
                        child: Assets.images.seeLocation.image(height: 30.0),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 80.0),
                Row(
                  children: [
                    IconButton(
                      onPressed: _reverseCamera,
                      icon: Assets.icons.reverse.svg(width: 48.0),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: _takePicture,
                      icon: const Icon(
                        Icons.circle,
                        size: 70.0,
                      ),
                      color: AppColors.red,
                    ),
                    const Spacer(),
                    const SizedBox(width: 48.0),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
