import 'package:flutter/material.dart';
import 'package:odyssey/components/card.dart';

class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  int _currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xff21574A), Colors.white])),
            child: Column(
              children: <Widget>[
                Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                        padding: EdgeInsets.fromLTRB(30, 0, 0, 10),
                        child: Text("Go",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 50,
                              fontFamily: 'KulimPark',
                              fontWeight: FontWeight.w700,
                            )))),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                  height: 500,
                  child: GridView(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CardComponent(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CardComponent(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CardComponent(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
