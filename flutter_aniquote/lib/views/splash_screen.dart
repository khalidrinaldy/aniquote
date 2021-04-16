import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/logo.png"),
            Text("AniQuote", style: TextStyle(fontFamily: 'Rancho', fontSize: 36),)
          ],
        ),
      ),
    );
  }
}