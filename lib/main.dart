import 'package:flutter/material.dart';
import 'package:Otobook/screens/start.dart';



void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OTOBOOK',
      debugShowCheckedModeBanner: false,
      home:const StartScreen(),
    );
  }
}