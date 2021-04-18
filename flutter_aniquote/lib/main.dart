import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_aniquote/routes/routes.dart';
import 'package:flutter_aniquote/views/about_screen.dart';
import 'package:flutter_aniquote/views/detail_title.dart';
import 'package:flutter_aniquote/views/explore_title.dart';
import 'package:flutter_aniquote/views/home_screen.dart';
import 'package:flutter_aniquote/views/login_screen.dart';
import 'package:flutter_aniquote/views/register_screen.dart';
import 'package:flutter_aniquote/views/splash_screen.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Splash(),
      theme: ThemeData(
        primaryColor: Color(0xFFE20264),
      ),
      onGenerateRoute: Routes.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}