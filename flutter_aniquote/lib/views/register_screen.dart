import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(top: 40),
            child: Column(
              children: [
                Image.asset("assets/images/logo.png"),
                Text("AniQuote", style: TextStyle(fontFamily: 'Rancho', fontSize: 36),)
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 35),
            alignment: Alignment.center,
            child: Text("Sign Up", style: TextStyle(fontFamily: "Nunito", fontSize: 24, fontWeight: FontWeight.w600),),
          ),
          Container(
            margin: EdgeInsets.only(top: 13),
            padding: EdgeInsets.only(left: 34, right: 34),
            alignment: Alignment.center,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFE20264),
                    width: 1
                  )
                ),
                labelText: "Email",
                labelStyle: TextStyle(fontFamily: "Nunito", fontSize: 18),
                filled: true,
                fillColor: Color(0xFFBEA5AB).withOpacity(0.3)
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 13),
            padding: EdgeInsets.only(left: 34, right: 34),
            alignment: Alignment.center,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFE20264),
                    width: 1
                  )
                ),
                labelText: "Password",
                labelStyle: TextStyle(fontFamily: "Nunito", fontSize: 18),
                filled: true,
                fillColor: Color(0xFFBEA5AB).withOpacity(0.3)
              ),
            ),
          ),
          Container(
            height: 41,
            margin: EdgeInsets.only(top: 35, left: 35, right: 35),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0xFFE20264)),
              ),
              child: Text("Register", style: TextStyle(fontFamily: "Nunito", fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white),),
              onPressed: (){},
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 3, left: 35, right: 35),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 1,
                  width: 123,
                  color: Colors.black.withOpacity(0.4),
                ),
                Text("Or", style: TextStyle(fontFamily: "Nunito", fontSize: 18),),
                Container(
                  height: 1,
                  width: 123,
                  color: Colors.black.withOpacity(0.4),
                ),
              ],
            ),
          ),
          Container(
            height: 41,
            margin: EdgeInsets.only(top: 3, left: 35, right: 35),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0xFF2F4858).withOpacity(0.71)),
              ),
              child: Text("Sign In to Existing Account", style: TextStyle(fontFamily: "Nunito", fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white),),
              onPressed: (){},
            ),
          ),
        ],
      ),
    );
  }
}