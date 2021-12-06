import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:odyssey/components/card.dart';
import 'package:odyssey/components/card_stateless.dart';
import 'package:odyssey/main.dart';
import 'package:getwidget/getwidget.dart';
import 'package:dio/dio.dart';
import 'package:odyssey/model/destination.dart';
import 'package:odyssey/model/multiple_destination_response.dart';
import 'package:odyssey/pages/explore.dart';
// import 'package:odyssey/service/httpService.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController nameController = TextEditingController();
  int _currentIndex = 2;

  bool isLoading = false;
  List<Destination> _destinations = <Destination>[];
  @override
  void initState() {
    super.initState();
    _populateDestinations();
  }

  void _populateDestinations() async {
    final destinations = await _fetchAllDestinations();
    setState(() {
      _destinations = destinations;
      print(_destinations);
    });
  }

  Future<List<Destination>> _fetchAllDestinations() async {
    final response = await http
        .get("http://192.168.0.20:3000/api/v1/destination");

    if (response.statusCode == 200) {
      final List<dynamic> result = jsonDecode(response.body);
      // print(response.body);
      return result.map((item) => Destination.fromJson(item)).toList();
    } else {
      throw Exception("Failed to load movies");
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      title: 'Odyssey Home',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              height: size.height * 1.05,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xff21574A), Colors.white])),
              child: Stack(
                children: <Widget>[
                  Positioned(
                      top: 0,
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
                                  controller: nameController,
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 15,
                                    color: Colors.white.withOpacity(0.7),
                                  ),
                                  decoration: InputDecoration(
                                    hintText:
                                        "Search a place you want to go...",
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
                              IconButton(
                                  onPressed: () => {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        Explore(name: nameController.text)))
                                      },
                                  icon:
                                      Icon(Icons.search, color: Colors.white)),
                            ],
                          ))),
                  Positioned(
                    top: size.height * 0.125,
                    left: 0,
                    right: 0,
                    child: Align(
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
                  ),
                  Positioned(
                    top: size.height * 0.2,
                    left: 0,
                    right: 0,
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                            padding: EdgeInsets.fromLTRB(30, 0, 0, 10),
                            child: Text("and",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 50,
                                  fontFamily: 'KulimPark',
                                  fontWeight: FontWeight.w700,
                                )))),
                  ),
                  Positioned(
                    top: size.height * 0.275,
                    left: 0,
                    right: 0,
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                            padding: EdgeInsets.fromLTRB(30, 0, 0, 20),
                            child: Text("Explore.",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 50,
                                  fontFamily: 'KulimPark',
                                  fontWeight: FontWeight.w700,
                                )))),
                  ),
                  Positioned(
                    top: size.height * 0.375,
                    left: 0,
                    right: 0,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(30, 0, 0, 20),
                        child: FlatButton(
                          padding: EdgeInsets.fromLTRB(20, 10, 20, 12.5),
                          color: Colors.white,
                          textColor: Color(0xff21574A),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Text('Explore!',
                              style: TextStyle(
                                fontFamily: 'KulimPark',
                                fontWeight: FontWeight.w700,
                                fontSize: 25,
                              )),
                          onPressed: () => {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        Explore(name: '',)))
                          },
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: size.height * 0.465,
                    child: Container(
                      width: size.width * 0.95,
                      height: size.height / 4,
                      margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          image: DecorationImage(
                            image: AssetImage('assets/images/home/badui.png'),
                            fit: BoxFit.fitHeight,
                          )),
                      child: Column(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              padding: EdgeInsets.fromLTRB(5, 15, 0, 0),
                              child: Text("Discover:",
                                  style: TextStyle(
                                    fontFamily: 'KulimPark',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 35,
                                    color: Colors.white,
                                  )),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                              child: Text("Baduy",
                                  style: TextStyle(
                                    fontFamily: 'KulimPark',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 35,
                                    color: Colors.white,
                                  )),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              padding: EdgeInsets.fromLTRB(5, 15, 0, 0),
                              child: Text(
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 13,
                                    color: Colors.white,
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: size.height * 0.71,
                    left: 0,
                    right: 0,
                    child: Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 50),
                        height: 300,
                        child: CardStateless(destination: _destinations)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
