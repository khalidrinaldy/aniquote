import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_aniquote/models/quote_model.dart';
import 'package:flutter_aniquote/views/drawer.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  TextEditingController _searchName = TextEditingController();
  String showingText = "Showing 10 random quotes";

  getQuoteData() async {
    var response;
    if (_searchName.text.length == 0) {
      response = await http.get(Uri.parse('https://animechan.vercel.app/api/quotes'));
    } else {
      response = await http.get(Uri.parse('https://animechan.vercel.app/api/quotes/character?name=${_searchName.text}'));
    }
    var jsonData = jsonDecode(response.body);

    List<Quote> quotes = [];

    if (response.statusCode == 200) {
      for (var q in jsonData) {
        Quote quote = Quote(q['anime'], q['character'], q['quote']);
        quotes.add(quote);
      }
    }
    print(jsonData);
    return quotes;
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    setState(() {
      getQuoteData();
    });
  }
  
  changeText() {
    if (_searchName.text.length != 0) {
      setState(() {
        showingText = "Showing search for \"${_searchName.text}\"";
      });
    } else {
      setState(() {
        showingText = "Showing 10 random quotes";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      drawer: DrawerScreen(),
      body: ListView(
        children: [
          Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 23),
              child: Text.rich(TextSpan(children: [
                TextSpan(
                    text: "Welcome ${_firebaseAuth.currentUser.email.substring(0, _firebaseAuth.currentUser.email.indexOf('@'))}\n",
                    style: TextStyle(fontFamily: "Nunito", fontSize: 24, fontWeight: FontWeight.w700)),
                TextSpan(
                    text: "Let’s motivate yourself with our anime quotes !",
                    style: TextStyle(fontFamily: "Nunito", fontSize: 14, fontWeight: FontWeight.w700, color: Colors.black.withOpacity(0.4)))
              ]))),
          Container(
            margin: EdgeInsets.only(top: 24, left: 34, right: 47, bottom: 32),
            height: 42,
            child: TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  labelText: "Search by character name...",
                  labelStyle: TextStyle(
                    fontFamily: "Nunito",
                    fontSize: 18,
                  ),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: BorderSide.none),
                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: BorderSide(color: Color(0xFFE20264))),
                  filled: true,
                  fillColor: Color(0xFFC4C4C4).withOpacity(0.3)
              ),
              onSubmitted: (value) {
                setState(() {
                  _searchName.text = value;
                });
                changeText();
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
            child: Text(showingText, style: TextStyle(fontFamily: "Nunito", fontSize: 14, fontWeight: FontWeight.w700, color: Colors.black.withOpacity(0.4)),)
          ),
          FutureBuilder(
              future: getQuoteData(),
              builder: (context, snapshot) {
                if (snapshot.data == null) {
                  return Container(
                    child: Center(
                      child: Text(
                        "Loading...",
                        style: TextStyle(fontFamily: "Nunito"),
                      ),
                    ),
                  );
                } else {
                  return Container(
                    height: 320,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, i) => Container(
                        margin: EdgeInsets.only(left: 29, right: 29, top: 20),
                        child: Card(
                          shadowColor: Colors.black.withOpacity(0.25),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10), side: BorderSide.none),
                          elevation: 0,
                          child: ListTile(
                            leading: Icon(
                              Icons.format_quote,
                              color: Color(0xFFE20264),
                              size: 40,
                            ),
                            title: Text(
                              snapshot.data[i].quote,
                              style: TextStyle(fontFamily: "Balsamiq Sans", fontSize: 18, color: Color(0xFF304F77)),
                            ),
                            subtitle: Text(
                              "by ${snapshot.data[i].character} (${snapshot.data[i].anime})",
                              style: TextStyle(fontFamily: "Nunito", fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                            boxShadow: [BoxShadow(blurRadius: 12, spreadRadius: -10, offset: Offset(0, 1), color: Colors.black.withOpacity(0.25))]),
                      ),
                    ),
                  );
                }
              })
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}
