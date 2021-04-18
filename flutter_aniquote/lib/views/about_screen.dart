import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "About Us",
          style: TextStyle(fontFamily: "Nunito", fontWeight: FontWeight.w700, color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(top: 17, bottom: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/images/logo.png"),
                Text("AniQuote", style: TextStyle(fontFamily: 'Rancho', fontSize: 36),)
              ],
            ),
          ),
          Container(
            height: 1,
            margin: EdgeInsets.only(bottom: 45.5),
            color: Colors.black.withOpacity(0.26),
          ),
          Container(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 23),
                  child: Text(
                    "About Us",
                    style: TextStyle(fontFamily: "Nunito", fontSize: 24, fontWeight: FontWeight.w700),
                  ),
                ),
                Text(
                  "Welcome to AniQuote! First, I want to thank you for downloaded this mobile app. This mobile app is using free public-apis named Animechan. Created by Khalid Rinaldy.",
                  style: TextStyle(fontFamily: "Nunito", fontSize: 18),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          )
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}