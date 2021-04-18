import 'package:flutter/material.dart';
import 'package:flutter_aniquote/views/login_screen.dart';
import 'package:splashscreen/splashscreen.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      navigateAfterSeconds: LoginScreen(),
      title: Text("AniQuote", style: TextStyle(fontFamily: 'Rancho', fontSize: 36),),
      image: Image.asset("assets/images/logo.png"),
      photoSize: 100,
      loaderColor: Color(0xFFE20264),
      backgroundColor: Colors.white,
    );
  }
}