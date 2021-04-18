import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TitleProvider with ChangeNotifier{
  List<String> animes = [];

  getAnimeData() async {
    var response = await http.get(Uri.parse('https://animechan.vercel.app/api/available/anime'));
    var jsonData = jsonDecode(response.body);

    if (response.statusCode == 200) {
      for (var q in jsonData) {
        if (q.length != 0) {
          animes.add(q);
        }
      }
    }
    print(jsonData);
    animes.sort();
    notifyListeners();
  }

  TitleProvider() {
    getAnimeData();
  }
}