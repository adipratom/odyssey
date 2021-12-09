// ignore_for_file: prefer_const_constructors, prefer_void_to_null, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_typing_uninitialized_variables, import_of_legacy_library_into_null_safe, avoid_print

import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:odyssey/components/picked_explore_comp.dart';
import 'package:odyssey/model/destination.dart';
import 'package:odyssey/pages/checkout.dart';
import 'dart:ui';
import 'package:http/http.dart' as http;
import 'dart:async';

class PickedExplore extends StatefulWidget {
  late final String id;
  // ignore: non_constant_identifier_names
  PickedExplore({required this.id});

  @override
  PickedExploreState createState() => PickedExploreState();
}

class PickedExploreState extends State<PickedExplore> {
  var person;
  var dateChoosen;
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
        dateChoosen = date;
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
    final response = await http
        .get("http://192.168.100.10:3000/api/v1/destination/${widget.id}");

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
            child: Column(
          children: [
            FutureBuilder(
              future: _fetchAllDestinations(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.hasData) {
                  return PickedExploreComponent(
                    destination: _destinations,
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(10, 10),
                      blurRadius: 25,
                      color: Colors.black.withOpacity(0.23))
                ],
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //Count of person button
                    Container(
                      decoration: BoxDecoration(
                          color: Color(0x337A7A7A),
                          borderRadius: BorderRadius.circular(7)),
                      padding: EdgeInsets.all(10),
                      width: 90,
                      height: 36,
                      alignment: Alignment.center,
                      child: DropdownButton<int>(
                        value: dropdownValue,
                        icon: const Icon(Icons.eject, color: Color(0xFF7A7A7A)),
                        iconSize: 20,
                        style: const TextStyle(color: Color(0xFF7A7A7A)),
                        onChanged: (int? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                            person = dropdownValue;
                          });
                        },
                        items: <int>[1, 2, 3, 4, 5, 6]
                            .map<DropdownMenuItem<int>>((int value) {
                          return DropdownMenuItem<int>(
                            value: value,
                            child: Text(
                              value.toString(),
                              style: TextStyle(
                                  color: Color(0xFF7A7A7A),
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    //Date button
                    Container(
                      decoration: BoxDecoration(
                          color: Color(0x337A7A7A),
                          borderRadius: BorderRadius.circular(7)),
                      padding: EdgeInsets.all(10),
                      width: 90,
                      height: 36,
                      alignment: Alignment.center,
                      child: MaterialButton(
                        child: Text('Date',
                            style: TextStyle(
                                color: Color(0xFF7A7A7A),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600)),
                        onPressed: () {
                          selectTimePicker(context);
                        },
                      ),
                    ),
                    //Order button
                    Container(
                      width: 90,
                      alignment: Alignment.center,
                      child: Container(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xff21574A),
                            alignment: Alignment.center,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7)),
                            textStyle: const TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          child: Text('Order',
                              style: TextStyle(color: Colors.white)),
                          onPressed: () => {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) => CheckOut(
                                        person: person,
                                        date: dateChoosen,
                                        name: _destinations[0].name,
                                        price: _destinations[0].price,
                                        picture: _destinations[0].photo,
                                        id: _destinations[0].id)))
                          },
                        ),
                      ),
                    ),
                  ]),
            ),
            Padding(padding: EdgeInsets.only(bottom: 30)),
          ],
        )),
      ),
    ));
  }
}
