import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:odyssey/components/picked_explore_comp.dart';
import 'package:odyssey/model/destination.dart';
import 'dart:ui';
import 'package:odyssey/pages/home.dart';
import 'package:http/http.dart' as http;
import 'package:numberpicker/numberpicker.dart';
import 'dart:async';

class PickedExplore extends StatefulWidget {
  late final String id;
  // ignore: non_constant_identifier_names
  PickedExplore({required this.id});

  @override
  PickedExploreState createState() => PickedExploreState();
}

class PickedExploreState extends State<PickedExplore> {
  DateTime date = DateTime.now();
  Future<Null> selectTimePicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: date,
        firstDate: DateTime(2021),
        lastDate: DateTime(2030));
    if (picked != null && picked != date) {
      setState(() {
        date = picked;
      });
    }
  }

  int dropdownValue = 1;

  List<Destination> _destinations = <Destination>[];
  @override
  void initState() {
    _populateDestinations();
    super.initState();
  }

  void _populateDestinations() async {
    final destinations = await _fetchAllDestinations();
    setState(() {
      _destinations = destinations;
      print(_destinations);
    });
  }

  Future<List<Destination>> _fetchAllDestinations() async {
    final response =
        await http.get("http://192.168.100.10:3000/api/v1/destination/${widget.id}");

    if (response.statusCode == 200) {
      final List<dynamic> result = jsonDecode(response.body);
      print(response.body);
      return result.map((item) => Destination.fromJson(item)).toList();
    } else {
      throw Exception("Failed to load movies");
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
            child: SafeArea(
              child: FutureBuilder(
              future: _fetchAllDestinations(),
                builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if(snapshot.hasData) {
                    return PickedExploreComponent(destination: _destinations,);
                  } else {
                    return Center(child: CircularProgressIndicator(),);
                  }
                },
              // child: PickedExploreComponent(destination: _destinations,)),
          // child: Column(
          //   children: [
          //     Container(
          //       height: 350,
          //       decoration: BoxDecoration(
          //           boxShadow: [
          //             BoxShadow(
          //                 offset: Offset(0, 10),
          //                 blurRadius: 10,
          //                 color: Colors.black.withOpacity(0.35))
          //           ],
          //           image: DecorationImage(
          //             fit: BoxFit.cover,
          //             image:
          //                 AssetImage('assets/images/pickedExplore/image9.png'),
          //           )),
          //       child: Column(children: <Widget>[
          //         Positioned(
          //             bottom: 0,
          //             left: 0,
          //             right: 0,
          //             child: Container(
          //                 alignment: Alignment.center,
          //                 margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
          //                 padding: EdgeInsets.symmetric(horizontal: 20),
          //                 height: 54,
          //                 decoration: BoxDecoration(
          //                     color: Colors.white.withOpacity(0.35),
          //                     borderRadius: BorderRadius.circular(10),
          //                     boxShadow: [
          //                       BoxShadow(
          //                           offset: Offset(10, 10),
          //                           blurRadius: 50,
          //                           color: Colors.black.withOpacity(0.23))
          //                     ]),
          //                 child: Row(
          //                   children: [
          //                     IconButton(
          //                         onPressed: () => {
          //                               Navigator.pushReplacement(
          //                                   context,
          //                                   MaterialPageRoute(
          //                                       builder:
          //                                           (BuildContext context) =>
          //                                               Home()))
          //                             },
          //                         icon: Icon(Icons.arrow_back_ios,
          //                             color: Colors.white)),
          //                     Expanded(
          //                       child: Text(
          //                         'Back',
          //                         style: TextStyle(
          //                             fontFamily: 'Poppins',
          //                             fontSize: 15,
          //                             color: Colors.white),
          //                       ),
          //                     ),
          //                   ],
          //                 ))),
          //         Padding(padding: EdgeInsets.only(bottom: 150)),
          //         Center(
          //             child: RichText(
          //                 text: const TextSpan(
          //                     text: 'Open Trip |',
          //                     style: TextStyle(
          //                         fontWeight: FontWeight.w600,
          //                         fontFamily: 'KulimPark',
          //                         fontSize: 22,
          //                         color: Colors.white),
          //                     children: [
          //               TextSpan(
          //                   text: ' Challenging ',
          //                   style: TextStyle(
          //                     fontWeight: FontWeight.w600,
          //                     fontFamily: 'KulimPark',
          //                     color: Colors.white,
          //                     fontSize: 22,
          //                   )),
          //               WidgetSpan(
          //                 child: Icon(Icons.info_rounded,
          //                     size: 25, color: Colors.white),
          //               ),
          //               TextSpan(
          //                   text: '\n2D1N Lembang',
          //                   style: TextStyle(
          //                     fontWeight: FontWeight.w700,
          //                     fontFamily: 'KulimPark',
          //                     color: Colors.white,
          //                     fontSize: 55,
          //                   )),
          //             ]))),
          //       ]),
          //     ),
          //     Padding(padding: EdgeInsets.only(bottom: 30)),
          //     Container(
          //         alignment: Alignment.centerLeft,
          //         padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          //         child: RichText(
          //             text: const TextSpan(
          //                 text: 'Provided by: ',
          //                 style: TextStyle(
          //                     fontWeight: FontWeight.w600,
          //                     fontFamily: 'KulimPark',
          //                     fontSize: 22,
          //                     color: Colors.black),
          //                 children: [
          //               TextSpan(
          //                   text: 'Nusantara Travel Agent',
          //                   style: TextStyle(
          //                     fontWeight: FontWeight.w500,
          //                     fontFamily: 'KulimPark',
          //                     color: Colors.black,
          //                     fontSize: 22,
          //                   )),
          //             ]))),
          //     Padding(padding: EdgeInsets.only(bottom: 30)),
          //     Container(
          //         alignment: Alignment.centerLeft,
          //         padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          //         child: RichText(
          //             text: const TextSpan(
          //                 text: 'Description: ',
          //                 style: TextStyle(
          //                     fontWeight: FontWeight.w600,
          //                     fontFamily: 'KulimPark',
          //                     fontSize: 22,
          //                     color: Colors.black),
          //                 children: [
          //               TextSpan(
          //                   text:
          //                       '\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
          //                   style: TextStyle(
          //                     fontWeight: FontWeight.w400,
          //                     fontFamily: 'Poppins',
          //                     color: Colors.black54,
          //                     fontSize: 16,
          //                   )),
          //             ]))),
          //     Padding(padding: EdgeInsets.only(bottom: 30)),
          //     Container(
          //         alignment: Alignment.centerLeft,
          //         padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          //         child: RichText(
          //             text: const TextSpan(
          //                 text: 'What will you have: ',
          //                 style: TextStyle(
          //                     fontWeight: FontWeight.w600,
          //                     fontFamily: 'KulimPark',
          //                     fontSize: 22,
          //                     color: Colors.black),
          //                 children: [
          //               TextSpan(
          //                   text:
          //                       '\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
          //                   style: TextStyle(
          //                     fontWeight: FontWeight.w400,
          //                     fontFamily: 'Poppins',
          //                     color: Colors.black54,
          //                     fontSize: 16,
          //                   )),
          //             ]))),
          //     Padding(padding: EdgeInsets.only(bottom: 30)),
          //     //Rating
          //     Container(
          //         padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          //         alignment: Alignment.centerLeft,
          //         child: RichText(
          //             text: const TextSpan(
          //                 text: 'Rating: ',
          //                 style: TextStyle(
          //                     fontWeight: FontWeight.w600,
          //                     fontFamily: 'KulimPark',
          //                     fontSize: 22,
          //                     color: Colors.black),
          //                 children: [
          //               TextSpan(
          //                   text: '4.5',
          //                   style: TextStyle(
          //                     fontWeight: FontWeight.w400,
          //                     fontFamily: 'Poppins',
          //                     color: Colors.black,
          //                     fontSize: 22,
          //                   )),
          //             ]))),
          //     Padding(padding: EdgeInsets.only(bottom: 30)),
          //     //Reviews
          //     Container(
          //       padding: EdgeInsets.fromLTRB(20, 0, 20, 30),
          //       alignment: Alignment.centerLeft,
          //       child: Text(
          //         'Reviews: ',
          //         style: TextStyle(
          //             fontWeight: FontWeight.w600,
          //             fontFamily: 'KulimPark',
          //             fontSize: 22,
          //             color: Colors.black),
          //       ),
          //     ),
          //     Container(
          //       padding: EdgeInsets.symmetric(horizontal: 20),
          //       child: ListView(
          //         shrinkWrap: true,
          //         children: [
          //           Container(
          //             width: 200,
          //             padding: EdgeInsets.all(15),
          //             decoration: BoxDecoration(
          //               color: Color(0xffA6AA9B),
          //               borderRadius: BorderRadius.circular(15),
          //             ),
          //             child: IntrinsicHeight(
          //               child: Row(
          //                 crossAxisAlignment: CrossAxisAlignment.stretch,
          //                 children: [
          //                   const Expanded(
          //                       flex: 2,
          //                       child: Icon(Icons.perm_identity_rounded,
          //                           color: Colors.white)),
          //                   Expanded(
          //                       flex: 8,
          //                       child: RichText(
          //                           softWrap: true,
          //                           text: const TextSpan(
          //                               text:
          //                                   'Lorem Ipsum dolor sit amat, con Lorem Ipsu',
          //                               style: TextStyle(
          //                                   fontWeight: FontWeight.w400,
          //                                   fontFamily: 'Poppins',
          //                                   color: Colors.white))))
          //                 ],
          //               ),
          //             ),
          //           ),
          //           Padding(padding: EdgeInsets.only(bottom: 30)),
          //           Container(
          //             width: 200,
          //             padding: EdgeInsets.all(15),
          //             decoration: BoxDecoration(
          //               color: Color(0xffA6AA9B),
          //               borderRadius: BorderRadius.circular(15),
          //             ),
          //             child: IntrinsicHeight(
          //               child: Row(
          //                 crossAxisAlignment: CrossAxisAlignment.stretch,
          //                 children: [
          //                   const Expanded(
          //                       flex: 2,
          //                       child: Icon(Icons.perm_identity_rounded,
          //                           color: Colors.white)),
          //                   Expanded(
          //                       flex: 8,
          //                       child: RichText(
          //                           softWrap: true,
          //                           text: const TextSpan(
          //                               text:
          //                                   'Lorem Ipsum dolor sit amat, con Lorem Ipsu',
          //                               style: TextStyle(
          //                                   fontWeight: FontWeight.w400,
          //                                   fontFamily: 'Poppins',
          //                                   color: Colors.white))))
          //                 ],
          //               ),
          //             ),
          //           ),
          //           Padding(padding: EdgeInsets.only(bottom: 30)),
          //           Container(
          //             width: 200,
          //             padding: EdgeInsets.all(15),
          //             decoration: BoxDecoration(
          //               color: Color(0xffA6AA9B),
          //               borderRadius: BorderRadius.circular(15),
          //             ),
          //             child: IntrinsicHeight(
          //               child: Row(
          //                 crossAxisAlignment: CrossAxisAlignment.stretch,
          //                 children: [
          //                   const Expanded(
          //                       flex: 2,
          //                       child: Icon(Icons.perm_identity_rounded,
          //                           color: Colors.white)),
          //                   Expanded(
          //                       flex: 8,
          //                       child: RichText(
          //                           softWrap: true,
          //                           text: const TextSpan(
          //                               text:
          //                                   'Lorem Ipsum dolor sit amat, con Lorem Ipsu',
          //                               style: TextStyle(
          //                                   fontWeight: FontWeight.w400,
          //                                   fontFamily: 'Poppins',
          //                                   color: Colors.white))))
          //                 ],
          //               ),
          //             ),
          //           )
          //         ],
          //       ),
          //     ),
          //     Padding(padding: EdgeInsets.only(bottom: 30)),
          //     //Order Bar
          //     Container(
          //       margin: EdgeInsets.only(left: 20, right: 20),
          //       padding: EdgeInsets.all(10),
          //       decoration: BoxDecoration(
          //         color: Colors.white,
          //         borderRadius: BorderRadius.circular(15),
          //         boxShadow: [
          //           BoxShadow(
          //               offset: Offset(10, 10),
          //               blurRadius: 25,
          //               color: Colors.black.withOpacity(0.23))
          //         ],
          //       ),
          //       child: Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //           children: [
          //             Container(
          //               decoration: BoxDecoration(
          //                   color: Color(0x337A7A7A),
          //                   borderRadius: BorderRadius.circular(4)),
          //               padding: EdgeInsets.all(10),
          //               width: 90,
          //               height: 36,
          //               alignment: Alignment.center,
          //               child: DropdownButton<int>(
          //                 value: dropdownValue,
          //                 icon:
          //                     const Icon(Icons.eject, color: Color(0xFF7A7A7A)),
          //                 iconSize: 17,
          //                 style: const TextStyle(color: Color(0xFF7A7A7A)),
          //                 onChanged: (int? newValue) {
          //                   setState(() {
          //                     dropdownValue = newValue!;
          //                   });
          //                 },
          //                 items: <int>[1, 2, 3, 4, 5, 6]
          //                     .map<DropdownMenuItem<int>>((int value) {
          //                   return DropdownMenuItem<int>(
          //                     value: value,
          //                     child: Text(value.toString()),
          //                   );
          //                 }).toList(),
          //               ),
          //             ),
          //             Container(
          //               decoration: BoxDecoration(
          //                   color: Color(0x337A7A7A),
          //                   borderRadius: BorderRadius.circular(4)),
          //               padding: EdgeInsets.all(10),
          //               width: 90,
          //               height: 36,
          //               alignment: Alignment.center,
          //               child: MaterialButton(
          //                 child: Text('Date',
          //                     style: TextStyle(color: Color(0xFF7A7A7A))),
          //                 onPressed: () {
          //                   selectTimePicker(context);
          //                 },
          //               ),
          //             ),
          //             Container(
          //               width: 90,
          //               alignment: Alignment.center,
          //               child: MaterialButton(
          //                 color: Color(0xFF21574A),
          //                 child: Text('Order',
          //                     style: TextStyle(color: Colors.white)),
          //                 onPressed: () {},
          //               ),
          //             ),
          //           ]),
          //     ),
          //     Padding(padding: EdgeInsets.only(bottom: 30)),
          //   ],
          // ),
        )
        ),
      ),
    ));
  }
}
