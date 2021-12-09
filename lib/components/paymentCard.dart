// ignore_for_file: prefer_const_constructors, camel_case_types, avoid_unnecessary_containers, file_names, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class paymentCard extends StatelessWidget {
  const paymentCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildPaymentCard();
  }

  Widget buildPaymentCard() => Container(
        alignment: Alignment.topLeft,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                padding: EdgeInsets.all(5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.asset(
                    'assets/images/home/badui.png',
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                )),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                        child: Text("Sangiang Island",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight.w600)))),
                Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                        child: RichText(
                            text: TextSpan(
                                style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                                children: <TextSpan>[
                          TextSpan(text: "Provided by"),
                          TextSpan(
                              text: " Nusa Travel Agent",
                              style: TextStyle(fontWeight: FontWeight.bold))
                        ])))),
                Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 156, 161, 141),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Text("Waiting for Payment",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 10,
                                color: Colors.white,
                                fontWeight: FontWeight.w600)))),
              ],
            ),
            SizedBox(width: 55),
            Container(
              padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
              child: Icon(Icons.chevron_right),
            )
          ],
        ),
      );
}
