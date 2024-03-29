import 'package:apitask/screen/auth/login_page.dart';
import 'package:apitask/screen/home_screen.dart';
import 'package:flutter/material.dart';

import 'screen/auth/signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}

