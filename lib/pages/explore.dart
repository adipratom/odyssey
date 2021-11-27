import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:odyssey/components/card.dart';
import 'package:odyssey/main.dart';
import 'package:getwidget/getwidget.dart';

class Explore extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ExplorePage();
}

class ExplorePage extends State<Explore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            constraints: BoxConstraints(minHeight: 776),
            decoration: const BoxDecoration(
              color : Color(0xff9CA18D)
            ),
          child: Column(
              children: [
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        height: 54,
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 10),
                                  blurRadius: 50,
                                  color: Colors.black.withOpacity(0.23))
                            ]),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 15,
                                  color: Colors.white.withOpacity(0.7),
                                ),
                                decoration: InputDecoration(
                                  hintText: "Search a place you want to go...",
                                  hintStyle: TextStyle(
                                    color: Colors.white.withOpacity(0.7),
                                    fontFamily: 'Poppins',
                                    fontSize: 15,
                                  ),
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                ),
                              ),
                            ),
                            IconButton(onPressed: () {}, icon: Icon(Icons.search, color: Colors.white)),
                          ],
                        ))),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                  child: GridView(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      CardComponent(),
                      CardComponent(),
                      CardComponent(),
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
    ));
  }
}
