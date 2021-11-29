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
      body: CustomScrollView (
        slivers: <Widget>[
          SliverToBoxAdapter(
          child: Container(
            constraints: BoxConstraints(minHeight: 747),
            padding: EdgeInsets.only(top: 50),
            decoration: const BoxDecoration(
              color : Color(0xff21574A)
            ),
            child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Favourites',
                      style: TextStyle(
                        fontFamily: 'KulimPark',
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.w600,
                      )
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: GridView(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        // CardComponent(),
                        // CardComponent(),
                      ],
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 30,
                        childAspectRatio: (1.4 / 2.0)
                      )
                    ),
                  ),
            ]),
          )
        )
        ]
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: (){},
      child: Icon(Icons.add, color: Colors.white),
      backgroundColor: Color(0xff9CA18D),
    )
    );
  }
}
