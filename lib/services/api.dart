import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';

class GetData {
  final String _apiUrl = 'http://103.106.72.182:8771/api/';
  
  // Future<String?> _userId() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   return prefs.getString('id');
  // }

  String get Url => 'http://103.106.72.182:8771';

  // User management endpoints
  // GET user
  String get getUserUrl => '${_apiUrl}user';

  String get getUserIdUrl => '${_apiUrl}user';

  // POST add user
  String get addUserUrl => '${_apiUrl}user';

  // PUT update user by id
  String get updateUserByIdUrl => '${_apiUrl}user/';

  // DELETE user by id
  String get deleteUserByIdUrl => '${_apiUrl}user/';

  // Login
  String get loginUrl => '${_apiUrl}login';

  // Logout
  String get logoutUrl => '${_apiUrl}logout';

  // Attendance endpoints
  // POST absensi in
  String get absensiInUrl => '${_apiUrl}absensiIn/';

  // PUT absensi out
  String get absensiOutUrl => '${_apiUrl}absensiOut/';

  // GET absensi by user id
  String get absensiUrl => '${_apiUrl}absensi/';

  // Scheduling endpoints
  // POST add jadwal
  String get addJadwalUrl => '${_apiUrl}jadwal';

  // GET all jadwal
  String get getJadwalUrl => '${_apiUrl}jadwal';

  // PUT update jadwal by id
  String get updateJadwalByIdUrl => '${_apiUrl}jadwal/';

  // GET search jadwal
  String get searchJadwalUrl => '${_apiUrl}jadwalSearch';

  // Reporting endpoints
  // POST add laporan
  String get addLaporanUrl => '${_apiUrl}laporan';

  // GET all laporan
  String get getAllLaporanUrl => '${_apiUrl}laporan';

  // GET laporan by id
  String get getLaporanByIdUrl => '${_apiUrl}laporan/';

  // DELETE laporan by id
  String get deleteLaporanByIdUrl => '${_apiUrl}laporan/';
}
