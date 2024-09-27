import 'dart:convert';

import 'package:Viva/services/api.dart';
import 'package:flutter/material.dart';
import '../../../core/core.dart';
import '../widgets/menu_button.dart';
import 'package:Viva/screens/absensi_screen.dart';
import 'package:Viva/screens/notes_page.dart';
import 'package:Viva/screens/notification_page.dart';
import 'package:Viva/screens/permit_page.dart';
import 'package:Viva/screens/absensi_datang.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';


class HomeSpgPage extends StatefulWidget {
  const HomeSpgPage({super.key});

  @override
  State<HomeSpgPage> createState() => _HomeSpgPageState();
}

class _HomeSpgPageState extends State<HomeSpgPage> {
  //  Future<int?> getId() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? id = prefs.getString('id');
  //   if (id != null) {
  //     return int.tryParse(id);
  //   }
  //   return null;
  // }

  // Future<Map<String, dynamic>> getUserData() async {
  //   int? id = await getId();
  //   final response = await http.get(
  //     Uri.parse('${GetData().getUserIdUrl}/$id'),
  //   );

  //   if (response.statusCode == 200) {
  //     final Map<String, dynamic> data = json.decode(response.body);
      
  //     @override
  //     void setState(VoidCallback fn) {
  //       print(data['username']);
  //       super.setState(fn);
  //     }
  //     return {
  //       'username': data['username'],
  //       'path': data['path'],
  //     };
  //   } else {
  //     throw Exception('Failed to load');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: Assets.images.bgHome.provider(),
              alignment: Alignment.topCenter,
            ),
          ),
          child: ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50.0),
                    child: Image.network(
                      'https://i.pinimg.com/originals/1b/14/53/1b14536a5f7e70664550df4ccaa5b231.jpg',
                      width: 48.0,
                      height: 48.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SpaceWidth(12.0),
                  const Expanded(
                    child: Text(
                      'Hello, SPG',
                      
                      style: TextStyle(
                        fontSize: 18.0,
                        color: AppColors.white,
                      ),
                      maxLines: 2,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      context.push(const NotificationPage());
                    },
                    icon: Assets.icons.notificationRounded.svg(),
                  ),
                ],
              ),
              const SpaceHeight(24.0),
              Container(
                padding: const EdgeInsets.all(24.0),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  children: [
                    Text(
                      DateTime.now().toFormattedTime(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32.0,
                        color: AppColors.primary,
                      ),
                    ),
                    Text(
                      DateTime.now().toFormattedDate(),
                      style: const TextStyle(
                        color: AppColors.grey,
                        fontSize: 12.0,
                      ),
                    ),
                    const SpaceHeight(18.0),
                    const Divider(),
                    const SpaceHeight(30.0),
                    Text(
                      DateTime.now().toFormattedDate(),
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: AppColors.grey,
                      ),
                    ),
                    const SpaceHeight(6.0),
                    Text(
                      '${DateTime(2024, 3, 14, 8, 0).toFormattedTime()} - ${DateTime(2024, 3, 14, 16, 0).toFormattedTime()}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
              ),
              const SpaceHeight(80.0),
              GridView(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 30.0,
                  mainAxisSpacing: 30.0,
                ),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  MenuButton(
                    label: 'Datang',
                    iconPath: Assets.icons.menu.datang.path,
                    onPressed: () {
                      context.push(const AbsensiDatangPage());
                    },
                  ),
                  MenuButton(
                    label: 'Pulang',
                    iconPath: Assets.icons.menu.pulang.path,
                    onPressed: () {
                      // Tambahkan navigasi ke halaman absensi pulang SPG
                    },
                  ),
                  MenuButton(
                    label: 'Izin',
                    iconPath: Assets.icons.menu.izin.path,
                    onPressed: () {
                      context.push(const PermitPage());
                    },
                  ),
                  MenuButton(
                    label: 'Catatan',
                    iconPath: Assets.icons.menu.catatan.path,
                    onPressed: () {
                      context.push(const NotesPage());
                    },
                  ),
                ],
              ),
              const SpaceHeight(24.0),
              Button.filled(
                onPressed: () {
                  showBottomSheet(
                    backgroundColor: AppColors.white,
                    context: context,
                    builder: (context) => Container(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(
                            width: 60.0,
                            height: 8.0,
                            child: Divider(color: AppColors.lightSheet),
                          ),
                          const CloseButton(),
                          const Center(
                            child: Text(
                              'Oops !',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 24.0,
                              ),
                            ),
                          ),
                          const SpaceHeight(4.0),
                          const Center(
                            child: Text(
                              'Aplikasi ingin mengakses Kamera',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 15.0,
                              ),
                            ),
                          ),
                          const SpaceHeight(36.0),
                          Button.filled(
                            onPressed: () => context.pop(),
                            label: 'Tolak',
                            color: AppColors.secondary,
                          ),
                          const SpaceHeight(16.0),
                          Button.filled(
                            onPressed: () {
                              context.pop();
                              context.push(const AttendancePage());
                            },
                            label: 'Izinkan',
                          ),
                        ],
                      ),
                    ),
                  );
                },
                label: 'Attendance Using Face ID',
                icon: Assets.icons.attendance.svg(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
