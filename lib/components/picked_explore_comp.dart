// ignore_for_file: import_of_legacy_library_into_null_safe, must_be_immutable, use_key_in_widget_constructors, prefer_const_constructors, avoid_print, avoid_unnecessary_containers, unused_local_variable

import 'package:flutter/material.dart';
import 'package:odyssey/main.dart';
import 'package:odyssey/model/destination.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PickedExploreComponent extends StatelessWidget {
  // const PickedExploreComponent({ Key? key }) : super(key: key);
  final List<Destination> destination;
  final String id;
  final String userId;
  PickedExploreComponent(
      {required this.destination, required this.id, required this.userId});
  TextEditingController destinationId = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            height: 350,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 10,
                      color: Colors.black.withOpacity(0.35))
                ],
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(destination[0].photo),
                )),
            child: Column(children: <Widget>[
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
                          IconButton(
                              onPressed: () => {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                Main(
                                                  id: id,
                                                  indexPage: 0,
                                                )))
                                  },
                              icon: Icon(Icons.arrow_back_ios,
                                  color: Colors.white)),
                          Expanded(
                            child: Text(
                              'Back',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 15,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ))),
              Padding(padding: EdgeInsets.only(bottom: 150)),
              Center(
                  child: RichText(
                      text: TextSpan(
                          text: '${destination[0].type} |',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontFamily: 'KulimPark',
                              fontSize: 22,
                              color: Colors.white),
                          children: [
                    TextSpan(
                        text: ' ${destination[0].activityLevel} ',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: 'KulimPark',
                          color: Colors.white,
                          fontSize: 22,
                        )),
                    WidgetSpan(
                        child: IconButton(
                            onPressed: () async {
                              try {
                                String destinationId = destination[0].id;
                                String jsonStr = jsonEncode({
                                  'destinationId': destinationId,
                                });
                                await http.put(
                                    // "http://192.168.100.10:3000/api/v1/users/${userId}/favorite",
                                    "https://odyssey-app-staging.herokuapp.com/api/v1/users/${userId}/favorite",
                                    body: jsonStr,
                                    headers: {
                                      "Content-Type": "application/json"
                                    }).then((result) {
                                  print(result);
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Main(id: userId, indexPage: 2)));
                                });
                              } catch (e) {
                                print(e);
                              }
                            },
                            icon: Icon(Icons.favorite,
                                size: 25, color: Colors.white))),
                    TextSpan(
                        text: '\n${destination[0].name}',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontFamily: 'KulimPark',
                          color: Colors.white,
                          fontSize: 30,
                        )),
                  ]))),
            ]),
          ),
          Padding(padding: EdgeInsets.only(bottom: 30)),
          Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: RichText(
                  text: const TextSpan(
                      text: 'Provided by: ',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: 'KulimPark',
                          fontSize: 22,
                          color: Colors.black),
                      children: [
                    TextSpan(
                        text: 'Nusantara Travel Agent',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: 'KulimPark',
                          color: Colors.black,
                          fontSize: 22,
                        )),
                  ]))),
          Padding(padding: EdgeInsets.only(bottom: 30)),
          Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: RichText(
                  text: TextSpan(
                      text: 'Description: ',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: 'KulimPark',
                          fontSize: 22,
                          color: Colors.black),
                      children: [
                    TextSpan(
                        text: '\n${destination[0].description}',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Poppins',
                          color: Colors.black54,
                          fontSize: 16,
                        )),
                  ]))),
          Padding(padding: EdgeInsets.only(bottom: 30)),
          Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: RichText(
                  text: TextSpan(
                      text: 'What will you have: ',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: 'KulimPark',
                          fontSize: 22,
                          color: Colors.black),
                      children: [
                    TextSpan(
                        text: '\n${destination[0].benefits}',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Poppins',
                          color: Colors.black54,
                          fontSize: 16,
                        )),
                  ]))),
          Padding(padding: EdgeInsets.only(bottom: 30)),
          Container(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
              alignment: Alignment.centerLeft,
              child: RichText(
                  text: TextSpan(
                      text: 'Rating: ',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: 'KulimPark',
                          fontSize: 22,
                          color: Colors.black),
                      children: [
                    TextSpan(
                        text: '${destination[0].rating}',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Poppins',
                          color: Colors.black,
                          fontSize: 22,
                        )),
                  ]))),
          Padding(padding: EdgeInsets.only(bottom: 30)),
          Container(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 30),
            alignment: Alignment.centerLeft,
            child: Text(
              'Reviews: ',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: 'KulimPark',
                  fontSize: 22,
                  color: Colors.black),
            ),
          ),
          Container(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: destination[0].review.length,
                itemBuilder: (context, index) {
                  final item = destination[0].review[index];

                  return Column(
                    children: [
                      Container(
                        width: 200,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Color(0xffA6AA9B),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: IntrinsicHeight(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const Expanded(
                                  flex: 2,
                                  child: Icon(Icons.perm_identity_rounded,
                                      color: Colors.white)),
                              Expanded(
                                  flex: 8,
                                  child: RichText(
                                      softWrap: true,
                                      text: const TextSpan(
                                          text:
                                              'Lorem Ipsum dolor sit amat, con Lorem Ipsu',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'Poppins',
                                              color: Colors.white))))
                            ],
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 30)),
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }
}
