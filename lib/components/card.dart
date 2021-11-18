import 'package:flutter/material.dart';
class CardComponent extends StatelessWidget {
  const CardComponent({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildCard();
  }

    Widget buildCard() => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
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
                    child: Text("2D1N Lembang",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: "KulimPark",
                          fontWeight: FontWeight.bold,
                        )))),
            Align(
                alignment: Alignment.centerLeft,
                child: Container(
                    child: Text("Open Trip | Challenging",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontFamily: "KulimPark")))),
            Align(
                alignment: Alignment.centerLeft,
                child: Container(
                    child: Text("4.0",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontFamily: "KulimPark")))),
            Align(
                alignment: Alignment.centerLeft,
                child: Container(
                    child: Text("Rp200.000,00/pax",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontFamily: "KulimPark")))),
          ],
        ),
      );
}