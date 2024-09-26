import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AttendanceWidget extends StatefulWidget {
  @override
  _AttendanceWidgetState createState() => _AttendanceWidgetState();
}

class _AttendanceWidgetState extends State<AttendanceWidget> {
  String checkInTime = '08:30';
  String checkOutTime = '16:30';
  String checkInStatus = 'On time';
  String checkOutStatus = 'Go home';

  void handleCheckIn() {
    setState(() {
      checkInTime = DateFormat('HH:mm').format(DateTime.now());
      checkInStatus = 'Checked in';
    });
  }

  void handleCheckOut() {
    setState(() {
      checkOutTime = DateFormat('HH:mm').format(DateTime.now());
      checkOutStatus = 'Checked out';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 169,
      decoration: BoxDecoration(),
      child: Stack(
        children: [
          Positioned(
            left: 16,
            top: 21,
            child: Text(
              'Today Attendance',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontFamily: 'Montserrat',
                height: 1.2, // Menyesuaikan jarak antar teks
              ),
            ),
          ),
          Positioned(
            left: 16,
            top: 48,
            child: GestureDetector(
              onTap: handleCheckIn,
              child: Container(
                width: 155,
                height: 100,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: Color(0xFFFE8F12)),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      left: 7,
                      top: 11,
                      child: Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage("https://picsum.photos/24/24"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 44,
                      top: 12,
                      child: Text(
                        'Check in',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 19.20,
                          fontFamily: 'Montserrat',
                          height: 1.2,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 9,
                      top: 47,
                      child: Text(
                        checkInTime,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.53,
                          fontFamily: 'Montserrat',
                          height: 1.2,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 9,
                      top: 71,
                      child: Text(
                        checkInStatus,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: 'Montserrat',
                          height: 1.2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 191,
            top: 48,
            child: GestureDetector(
              onTap: handleCheckOut,
              child: Container(
                width: 155,
                height: 100,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: Color(0xFFFE8F12)),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      left: 7,
                      top: 11,
                      child: Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage("https://picsum.photos/24/24"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 36,
                      top: 12,
                      child: Text(
                        'Check out',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 19.20,
                          fontFamily: 'Montserrat',
                          height: 1.2,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 12,
                      top: 47,
                      child: Text(
                        checkOutTime,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.53,
                          fontFamily: 'Montserrat',
                          height: 1.2,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 12,
                      top: 71,
                      child: Text(
                        checkOutStatus,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: 'Montserrat',
                          height: 1.2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
