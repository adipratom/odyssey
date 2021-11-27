import 'package:flutter/material.dart';
import 'package:odyssey/components/card.dart';
import 'package:odyssey/main.dart';
import 'package:getwidget/getwidget.dart';
import 'package:dio/dio.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 2;
  List<Object> users = [];

  // void getDio() async {
  //   try {
  //     var response =
  //         await Dio(BaseOptions(headers: {"Content-Type": "application/json"}))
  //             .get('http://localhost:3000/api/v1/destination');
  //     users = response.data;
  //     print(users);
  //     setState(() {});
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  @override
  void initState() {
    super.initState() ;
    // getDio();
  }

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
                            IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.search, color: Colors.white)),
                          ],
                        ))),
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
                Align(
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
                Align(
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
                Align(
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
                      onPressed: () {},
                    ),
                  ),
                ),
                Container(
                  width: size.width * 0.95,
                  height: size.height / 4,
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
                Container(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                  height: 270,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [],
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
