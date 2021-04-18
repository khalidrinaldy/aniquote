import 'package:flutter/material.dart';
import 'package:flutter_aniquote/providers/title_provider.dart';
import 'package:flutter_aniquote/views/drawer.dart';
import 'package:provider/provider.dart';

class ExploreTitle extends StatefulWidget {
  @override
  _ExploreTitleState createState() => _ExploreTitleState();
}

class _ExploreTitleState extends State<ExploreTitle> {
  TextEditingController _searchAnime = TextEditingController();
  List<String> searchList = [];

  filterSearch(value) {
    TitleProvider title = TitleProvider();
    List<String> list;
    list.addAll(title.animes);
    List<String> dummyList;
    if (value.length != 0) {
      dummyList = list.where((element) => element.toLowerCase() == value.toString().toLowerCase()).toList();

      print(list);
      setState(() {
        searchList.clear();
        searchList.addAll(dummyList);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TitleProvider(),
      child: Scaffold(
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
                  TextSpan(text: "Explore Anime Title\n", style: TextStyle(fontFamily: "Nunito", fontSize: 24, fontWeight: FontWeight.w700)),
                  TextSpan(
                      text: "Search by title",
                      style: TextStyle(fontFamily: "Nunito", fontSize: 14, fontWeight: FontWeight.w700, color: Colors.black.withOpacity(0.4)))
                ]))),
            Container(
              margin: EdgeInsets.only(top: 24, left: 34, right: 47, bottom: 32),
              height: 42,
              child: Consumer<TitleProvider>(
                builder: (context, titleProvider, _) => TextField(
                    controller: _searchAnime,
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                        labelText: "Search by Title...",
                        labelStyle: TextStyle(
                          fontFamily: "Nunito",
                          fontSize: 18,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: BorderSide(color: Color(0xFFE20264))),
                        filled: true,
                        fillColor: Color(0xFFC4C4C4).withOpacity(0.3)),
                    onSubmitted: (value) {
                      List<String> list = [];
                      list.addAll(titleProvider.animes);
                      List<String> dummyList;
                      if (value.length != 0) {
                        dummyList = list.where((element) => element.toLowerCase().contains(value.toString().toLowerCase())).toList();

                        print(dummyList);
                        setState(() {
                          searchList.clear();
                          searchList.addAll(dummyList);
                        });
                      } else {
                        setState(() {});
                      }
                    }),
              ),
            ),
            Consumer<TitleProvider>(
              builder: (context, titleProvider, _) => Container(
                height: 320,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: _searchAnime.text.length == 0 ? titleProvider.animes.length : searchList.length,
                  itemBuilder: (context, i) => GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/detail', arguments: _searchAnime.text.length == 0 ? titleProvider.animes[i] : searchList[i]),
                    child: Container(
                      margin: EdgeInsets.only(left: 29, right: 29, top: 20),
                      constraints: BoxConstraints(minHeight: 70),
                      child: Card(
                          shadowColor: Colors.black.withOpacity(0.25),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10), side: BorderSide.none),
                          elevation: 0,
                          child: ListTile(
                            title: Text(
                              _searchAnime.text.length == 0 ? titleProvider.animes[i] : searchList[i],
                              style: TextStyle(
                                fontFamily: "Balsamiq Sans",
                                fontSize: 18,
                                color: Color(0xFF304F77),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          )),
                      decoration: BoxDecoration(
                          boxShadow: [BoxShadow(blurRadius: 12, spreadRadius: -10, offset: Offset(0, 1), color: Colors.black.withOpacity(0.25))]),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}
