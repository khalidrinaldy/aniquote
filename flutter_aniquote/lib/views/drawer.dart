import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DrawerScreen extends StatelessWidget {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: [
        DrawerHeader(
          child: Column(
            children: [
              Image.asset("assets/images/logo.png"),
            ],
          ),
        ),
        ListTile(
            leading: Icon(
              Icons.home_outlined,
              color: Color(0xFF304F77),
            ),
            title: Text("Home", style: TextStyle(fontFamily: "Nunito", fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xFF304F77))),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/home');
            }),
        ListTile(
          leading: Icon(
            Icons.explore_outlined,
            color: Color(0xFF304F77),
          ),
          title:
              Text("Explore by Title", style: TextStyle(fontFamily: "Nunito", fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xFF304F77))),
          onTap: () {
            Navigator.pushReplacementNamed(context, '/explore');
          },
        ),
        ListTile(
          leading: Icon(
            Icons.help_outline_rounded,
            color: Color(0xFF304F77),
          ),
          title: Text("About Us", style: TextStyle(fontFamily: "Nunito", fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xFF304F77))),
          onTap: () {
            Navigator.pushNamed(context, '/about');
          },
        ),
        ListTile(
          leading: Icon(
            Icons.logout,
            color: Color(0xFF304F77),
          ),
          title: Text("Log out", style: TextStyle(fontFamily: "Nunito", fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xFF304F77))),
          onTap: () async {
            await _firebaseAuth.signOut().then((value) => {Navigator.pushReplacementNamed(context, '/login')});
          },
        ),
      ],
    ));
  }
}
