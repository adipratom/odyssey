import 'package:flutter/material.dart';

class CardComponent extends StatefulWidget {
  // const CardComponent({Key? key}) : super(key: key);
  var myObject;
  CardComponent(e, {this.myObject});

  @override
  State<CardComponent> createState() => _CardComponentState();
}

class _CardComponentState extends State<CardComponent> {
  @override
  Widget build(BuildContext context) {
    return buildCard();
  }

  Widget buildCard() => Container(
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
                  alignment: Alignment.centerLeft,
                  child: Container(
                      child: Text(widget.myObject.name,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: "KulimPark",
                            fontWeight: FontWeight.bold,
                          )))),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                      child: Text("${widget.myObject.type} | ${widget.myObject.activityLevel}",
                          textAlign: TextAlign.left,
                          style: TextStyle(fontFamily: "KulimPark")))),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                      child: Text("${widget.myObject.rating}",
                          textAlign: TextAlign.left,
                          style: TextStyle(fontFamily: "KulimPark")))),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                      child: Text("Rp${widget.myObject.price}/pax",
                          textAlign: TextAlign.left,
                          style: TextStyle(fontFamily: "KulimPark")))),
            ],
          ),
        ),
      );
}
