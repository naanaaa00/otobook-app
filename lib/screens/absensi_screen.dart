import 'dart:io';
import 'package:Viva/screens/camera.dart';
import 'package:Viva/screens/home.dart ';
import 'package:camera/camera.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';

class AbsenPage extends StatefulWidget {
  final XFile? image;

  const AbsenPage({super.key, this.image});

  @override
  State<AbsenPage> createState() => _AbsenPageState(this.image);
}

class _AbsenPageState extends State<AbsenPage> {
  _AbsenPageState(this.image);

  XFile? image;
  String strAlamat = "", strDate = "", strTime = "", strDateTime = "", strStatus = "Absen Masuk";
  bool isLoading = false;
  double dLat = 0.0, dLong = 0.0;
  int dateHours = 0, dateMinutes = 0;
  final controllerName = TextEditingController();

  @override
  void initState() {
    handleLocationPermission();
    setDateTime();
    setStatusAbsen();

    if (image != null) {
      isLoading = true;
      getGeoLocationPosition();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.pinkAccent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          "Menu Absensi",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Card(
            color: Colors.white,
            margin: const EdgeInsets.fromLTRB(10, 10, 10, 30),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 50,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    color: Colors.pinkAccent,
                  ),
                  child: const Row(
                    children: [
                      SizedBox(
                        width: 12,
                      ),
                      Icon(Icons.face_retouching_natural_outlined, color: Colors.white),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        "Absen Foto Selfie ya!",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(10, 20, 0, 20),
                  child: Text(
                    "Ambil Foto",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const CameraAbsenPage()));
                  },
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(10, 0, 10, 20),
                    width: size.width,
                    height: 150,
                    child: DottedBorder(
                        radius: const Radius.circular(10),
                        borderType: BorderType.RRect,
                        color: Colors.pinkAccent,
                        strokeWidth: 1,
                        dashPattern: const [5, 5],
                        child: SizedBox.expand(
                          child: FittedBox(
                            child: image != null
                                ? Image.file(File(image!.path), fit: BoxFit.cover)
                                : const Icon(
                                    Icons.camera_enhance_outlined,
                                    color: Colors.pinkAccent,
                            ),
                          ),
                        ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.text,
                    controller: controllerName,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                        labelText: "Masukan Nama Anda",
                        hintText: "Nama Anda",
                        hintStyle: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey),
                        labelStyle: const TextStyle(
                            fontSize: 14,
                            color: Colors.black),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.pinkAccent),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.pinkAccent),
                        ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: Text(
                    "Lokasi Anda",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                isLoading
                    ? const Center(child: CircularProgressIndicator(color: Colors.pinkAccent,))
                    : Padding(
                      padding: const EdgeInsets.all(10),
                      child: SizedBox(
                        height: 5 * 24,
                        child: TextField(
                          enabled: false,
                          maxLines: 5,
                          decoration: InputDecoration(
                            alignLabelWithHint: true,
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.pinkAccent),
                            ),
                            hintText: strAlamat.isNotEmpty
                                ? strAlamat
                                : 'Lokasi Kamu',
                            hintStyle: const TextStyle(
                                fontSize: 14, color: Colors.grey),
                            fillColor: Colors.transparent,
                            filled: true,
                          ),
                        ),
                      ),
                ),
                Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(30),
                    child: Material(
                      elevation: 3,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        width: size.width,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white),
                        child: Material(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.pinkAccent,
                          child: InkWell(
                            splashColor: Colors.pink,
                            borderRadius: BorderRadius.circular(20),
                            onTap: () {
                              if (image == null || controllerName.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                  content: Row(
                                    children: [
                                      Icon(
                                        Icons.info_outline,
                                        color: Colors.white,
                                      ),
                                      SizedBox(width: 10),
                                      Text("Ups, foto dan inputan tidak boleh kosong!",
                                          style: TextStyle(color: Colors.white))
                                    ],
                                  ),
                                  backgroundColor: Colors.redAccent,
                                  shape: StadiumBorder(),
                                  behavior: SnackBarBehavior.floating,
                                ));
                              } else {
                                showLoaderDialog(context);
                                // Simpan data absen ke penyimpanan lokal atau hanya tampilkan notifikasi
                                Future.delayed(const Duration(seconds: 2), () {
                                  Navigator.of(context).pop();
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Row(
                                      children: [
                                        Icon(
                                          Icons.check_circle_outline,
                                          color: Colors.white,
                                        ),
                                        SizedBox(width: 10),
                                        Text("Yeay! Absen berhasil!", style: TextStyle(color: Colors.white))
                                      ],
                                    ),
                                    backgroundColor: Colors.green,
                                    shape: StadiumBorder(),
                                    behavior: SnackBarBehavior.floating,
                                  ));
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
                                });
                              }
                            },
                            child: const Center(
                              child: Text(
                                "Absen Sekarang",
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )),
              ],
            )),
      ),
    );
  }

  //get realtime location
  Future<void> getGeoLocationPosition() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    setState(() {
      isLoading = false;
      getAddressFromLongLat(position);
    });
  }

  //get address by lat long
  Future<void> getAddressFromLongLat(Position position) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemarks[0];
    setState(() {
      dLat = position.latitude;
      dLong = position.longitude;
      strAlamat =
          '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    });
  }

  //handle permission for location
  Future<void> handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return;
    }
  }

  void setDateTime() {
    var dateNow = DateTime.now();
    strDate = DateFormat("EEEE, dd MMMM yyyy", "id_ID").format(dateNow);
    strTime = DateFormat("HH:mm:ss").format(dateNow);
    strDateTime = "$strDate $strTime";
  }

  void setStatusAbsen() {
    var dateNow = DateTime.now();
    dateHours = dateNow.hour;
    dateMinutes = dateNow.minute;
    setState(() {
      if (dateHours >= 0 && dateHours <= 10) {
        strStatus = "Absen Masuk";
      } else if (dateHours >= 10 && dateHours <= 23) {
        strStatus = "Absen Keluar";
      }
    });
  }

  showLoaderDialog(BuildContext context) {
    AlertDialog alert = const AlertDialog(
      content: Row(
        children: [
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.pinkAccent),
          ),
          SizedBox(width: 10),
          Text("Sedang menyimpan data..."),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
