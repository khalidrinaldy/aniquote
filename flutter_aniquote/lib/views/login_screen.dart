import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

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
            child: Text("Sign In", style: TextStyle(fontFamily: "Nunito", fontSize: 24, fontWeight: FontWeight.w600),),
          ),
          Container(
            margin: EdgeInsets.only(top: 13),
            padding: EdgeInsets.only(left: 34, right: 34),
            alignment: Alignment.center,
            child: TextField(
              controller: this._emailController,
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
              controller: this._passwordController,
              obscureText: true,
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
              child: Text("Login", style: TextStyle(fontFamily: "Nunito", fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white),),
              onPressed: () async{
                try {
                  await this._firebaseAuth.signInWithEmailAndPassword(
                    email: this._emailController.text,
                    password: this._passwordController.text
                  ).then((value) => {
                    Navigator.pushReplacementNamed(context, '/home')
                  });
                } catch (e) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Error"),
                        content: Text(e.message),
                        actions: [
                          TextButton(
                            child: Text("Ok"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          )
                        ],
                      );
                    }
                  );
                }
              }
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
              child: Text("Create an Account", style: TextStyle(fontFamily: "Nunito", fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white),),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/register');
              },
            ),
          ),
        ],
      ),
    );
  }
}