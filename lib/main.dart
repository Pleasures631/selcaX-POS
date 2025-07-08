import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const SelcaX());
}

class SelcaX extends StatelessWidget {
  const SelcaX({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Inter'
      ),
      title: 'Selca X POS',
      home: LoginScreen()
    );
  }
}
