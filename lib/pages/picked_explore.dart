import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:odyssey/pages/explore.dart';

class PickedExplore extends StatefulWidget {
  @override
  PickedExploreState createState() => PickedExploreState();
}

class PickedExploreState extends State<PickedExplore> {
  @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              height: 350,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 15),
                    blurRadius: 20,
                    color: Colors.black.withOpacity(0.35))
                ],
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/pickedExplore/image9.png'),
                )),
              child: Column(
                children: <Widget>[
                  Center(
                    child: RichText(
                      text: const TextSpan(
                  text: 'Open Trip |',
                  style: TextStyle(
                      fontFamily: 'KulimPark',
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.white),
                  children: <TextSpan>[
                    TextSpan(
                        text: '\nSign Up',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 18,
                        ),
                  )]))),
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
                              color: Colors.white.withOpacity(0.35),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(10, 10),
                                    blurRadius: 50,
                                    color: Colors.black.withOpacity(0.23))
                              ]),
                          child: Row(
                            children: [
                              IconButton(onPressed: () => {
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Explore()))},
                                icon: Icon(Icons.arrow_back_ios, color: Colors.white)),
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
                            ],
                          ))),
                  Container(),
                ],
              ),
            )
          )
        )
      );
  }
}
