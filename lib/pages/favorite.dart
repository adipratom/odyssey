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
    return Scaffold(
        body: SingleChildScrollView(
            child: SafeArea(
                child: Container(
      decoration: BoxDecoration(
        color: Color(0xff2185034),
      ),
      child: Column(
        children: <Widget>[
          Text("Favorite"),
          GridView(
            scrollDirection: Axis.vertical,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 10),
            children: <Widget>[
              CardComponent(),
              CardComponent(),
            ],
          ),
        ],
      ),
    ))));
  }
}
