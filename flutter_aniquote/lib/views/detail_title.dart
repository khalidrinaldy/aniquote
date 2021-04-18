import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_aniquote/models/quote_model.dart';
import 'package:http/http.dart' as http;

class DetailTitle extends StatelessWidget {
  final String _args;
  DetailTitle(this._args, {Key key}) : super(key: key);

  getQuoteData() async {
    var response = await http.get(Uri.parse('https://animechan.vercel.app/api/quotes/anime?title=$_args'));
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          this._args,
          style: TextStyle(fontFamily: "Nunito", fontWeight: FontWeight.w700, color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(top: 39, left: 29, right: 29, bottom: 32),
            child: Text("List of $_args Quotes", style: TextStyle(fontFamily: "Nunito", fontWeight: FontWeight.w700, fontSize: 24)),
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
                    height: 380,
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
              }
          ),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}
