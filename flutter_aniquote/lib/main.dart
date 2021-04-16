import 'package:flutter/material.dart';
import 'package:flutter_aniquote/views/login_screen.dart';
import 'package:flutter_aniquote/views/register_screen.dart';
import 'package:flutter_aniquote/views/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RegisterScreen(),
      theme: ThemeData(
        primaryColor: Color(0xFFE20264),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}