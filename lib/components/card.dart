import 'package:flutter/material.dart';
import 'package:odyssey/pages/picked_explore.dart';
import 'dart:ui';

class CardComponent extends StatefulWidget {
  // const CardComponent({Key? key}) : super(key: key);
  var myObject;
  // CardComponent(e, {this.myObject});

  @override
  State<CardComponent> createState() => _CardComponentState();
}

class _CardComponentState extends State<CardComponent> {
  @override
  Widget build(BuildContext context) {
    return buildCard(context);
  }

  Widget buildCard(context) => InkWell(
    onTap: () => {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) =>PickedExplore()))},
    child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Expanded(
            child: Column(
              children: [
                Container(
                    padding: EdgeInsets.all(10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.asset(
                        'assets/images/home/badui.png',
                        width: 140,
                        height: 125,
                        fit: BoxFit.cover,
                      ),
                    )),
                Align(
                    alignment: Alignment.center,
                    child: Container(
                        child: Text("2D1N Lembang",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: "KulimPark",
                              fontWeight: FontWeight.bold,
                            )))),
                Align(
                    alignment: Alignment.center,
                    child: Container(
                        child: Text("Open Trip | Challenging",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontFamily: "KulimPark")))),
                Align(
                    alignment: Alignment.center,
                    child: Container(
                        child: Text("4.0",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontFamily: "KulimPark")))),
                Align(
                    alignment: Alignment.center,
                    child: Container(
                        child: Text("Rp200.000,00/pax",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontFamily: "KulimPark")))),
              ],
            ),
          ),
        ),
  );
}
