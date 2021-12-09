import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:odyssey/main.dart';
import 'package:odyssey/pages/payment_success.dart';
import 'package:odyssey/pages/payment_pending.dart';
import 'package:odyssey/pages/payment_fail.dart';
import 'package:http/http.dart' as http;

class CheckOut extends StatefulWidget {
  late final int person;
  late final DateTime date;
  late final String name;
  late final String picture;
  late final String id;
  late final int price;
  // late final String userId;

  CheckOut(
      {required this.person,
      required this.date,
      required this.name,
      required this.price,
      // required this.userId,
      required this.picture,
      required this.id});
  @override
  CheckOutPage createState() => CheckOutPage();
}

class CheckOutPage extends State<CheckOut> {
  @override
  Widget build(BuildContext context) {
    var dateStart = widget.date;
    var dateEnd = dateStart.add(const Duration(days: 2));
    var totalPrice = widget.person * widget.price;
    const appTitle = 'Checkout';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                  onPressed: () => {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => Main(
                                      id: "6185512b11cd9b410c43833a",
                                      indexPage: 0,
                                    )))
                      },
                  icon: Icon(Icons.chevron_left));
            },
          ),
          title: const Text(appTitle,
              style: TextStyle(fontFamily: 'Poppins', fontSize: 20)),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                children: [
                  Container(
                    child: Container(
                      padding: EdgeInsets.all(15),
                      alignment: Alignment.topCenter,
                      constraints: BoxConstraints(maxWidth: 355),
                      decoration: BoxDecoration(
                          color: Color(0x40C4C4C4),
                          borderRadius: BorderRadius.circular(15.0)),
                      child: Column(
                        children: [
                          Container(
                              child: ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: Image.network(
                              widget.picture,
                              fit: BoxFit.cover,
                              height: 130,
                            ),
                          )),
                          Padding(padding: EdgeInsets.only(bottom: 10)),
                          Container(
                              alignment: Alignment.centerLeft,
                              child: RichText(
                                textAlign: TextAlign.left,
                                text: TextSpan(children: [
                                  TextSpan(
                                      text: widget.name,
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                        fontSize: 15,
                                      )),
                                  TextSpan(
                                      text: '\nProvided by ',
                                      style: TextStyle(
                                        height: 2.5,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                        fontSize: 13,
                                      )),
                                  TextSpan(
                                      text: 'Nusa Travel Agent\n',
                                      style: TextStyle(
                                        height: 2.5,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                        fontSize: 13,
                                      )),
                                  TextSpan(
                                      text: 'Rp ${widget.price.toString()}',
                                      style: TextStyle(
                                        height: 1.5,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                        fontSize: 13,
                                      )),
                                ]),
                              )),
                          Divider(
                            color: Colors.black26,
                            thickness: 1.4,
                            height: 30.0,
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                        text: 'Start From\n',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black38,
                                          fontSize: 13,
                                        )),
                                    TextSpan(
                                        text: widget.date
                                            .toIso8601String()
                                            .split("T")[0],
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                          fontSize: 13,
                                        )),
                                  ])),
                                ),
                                Container(
                                  child: Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          color: Color(0xffC4C4C4),
                                          borderRadius:
                                              BorderRadius.circular(30.0)),
                                      child: Text(
                                        '2 nights',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                          fontSize: 13,
                                        ),
                                      )),
                                ),
                                Container(
                                  child: RichText(
                                      textAlign: TextAlign.right,
                                      text: TextSpan(children: [
                                        TextSpan(
                                            text: 'End\n',
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black38,
                                              fontSize: 13,
                                            )),
                                        TextSpan(
                                            text: dateEnd
                                                .toIso8601String()
                                                .split("T")[0],
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black,
                                              fontSize: 13,
                                            )),
                                      ])),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 15)),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Payment Details',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: 20),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 10)),
                  Container(
                      child: Container(
                    padding: EdgeInsets.all(15),
                    alignment: Alignment.topCenter,
                    constraints: BoxConstraints(maxWidth: 355),
                    decoration: BoxDecoration(
                        color: Color(0x40C4C4C4),
                        borderRadius: BorderRadius.circular(15.0)),
                    child: Column(
                      children: [
                        Container(
                          child: Row(
                            children: [
                              RichText(
                                  text: TextSpan(children: [
                                // TextSpan(
                                //     text: widget.name,
                                //     style: TextStyle(
                                //       height: 1.5,
                                //       fontFamily: 'Poppins',
                                //       fontWeight: FontWeight.w500,
                                //       color: Colors.black,
                                //       fontSize: 13,
                                //     )),
                                TextSpan(
                                    text: '\nTotal Price',
                                    style: TextStyle(
                                      height: 2,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                      fontSize: 16,
                                    )),
                                TextSpan(text: '\n'),
                              ])),
                              RichText(
                                  textAlign: TextAlign.end,
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: '${widget.person} Guest',
                                        style: TextStyle(
                                          height: 1.5,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                          fontSize: 13,
                                        )),
                                    TextSpan(
                                        text:
                                            '\nRp ${(widget.price * widget.person)}',
                                        style: TextStyle(
                                          height: 2,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                          fontSize: 16,
                                        )),
                                    TextSpan(
                                        text:
                                            '\nMake sure the amount matches up',
                                        style: TextStyle(
                                          height: 2,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                          fontSize: 10,
                                        )),
                                  ])),
                            ],
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          ),
                        ),
                        Divider(
                          color: Colors.black26,
                          thickness: 1.4,
                          height: 30.0,
                        ),
                        Container(
                          child: Column(children: [
                            Container(
                              height: 60,
                              padding: EdgeInsets.only(left: 10, right: 3),
                              decoration: BoxDecoration(
                                  color: Color(0xff9CA18D),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'BCA',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text('12345678',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                      )),
                                  Container(
                                    child: TextButton(
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.content_copy,
                                              color: Colors.white,
                                              size: 15,
                                            ),
                                            Text(' Copy',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily: 'Poppins')),
                                          ],
                                        ),
                                        style: TextButton.styleFrom(
                                          tapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          alignment: Alignment.centerRight,
                                          primary: Colors.black,
                                          textStyle: const TextStyle(
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        onPressed: () {
                                          Clipboard.setData(
                                              ClipboardData(text: '1234567'));
                                        }),
                                  ),
                                ],
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(bottom: 10)),
                            Container(
                              height: 60,
                              padding: EdgeInsets.only(left: 10, right: 3),
                              decoration: BoxDecoration(
                                  color: Color(0xff9CA18D),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Mandiri',
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ),
                                  Text('837491234',
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white)),
                                  Container(
                                    child: TextButton(
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.content_copy,
                                              color: Colors.white,
                                              size: 15,
                                            ),
                                            Text(' Copy',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily: 'Poppins')),
                                          ],
                                        ),
                                        style: TextButton.styleFrom(
                                          tapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                          alignment: Alignment.centerRight,
                                          primary: Colors.black,
                                          textStyle: const TextStyle(
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        onPressed: () {
                                          Clipboard.setData(
                                              ClipboardData(text: '837491234'));
                                        }),
                                  ),
                                ],
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(bottom: 15)),
                            Container(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Atas Nama',
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w500)),
                                    Text('PT Nusa Wisata',
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w600)),
                                  ],
                                )),
                          ]),
                        ),
                      ],
                    ),
                  )),
                  Padding(padding: EdgeInsets.all(10)),
                  //Pay Now button
                  Container(
                      child: Container(
                    height: 60,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xff21574A),
                        alignment: Alignment.center,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        textStyle: const TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 20),
                      ),
                      onPressed: () async {
                        try {
                          String jsonStr = jsonEncode({
                            'startDate': '${widget.date}',
                            'finishedDate': '${dateEnd}',
                            'destination': '${widget.id}',
                            'totalPrice': '${totalPrice}',
                            'orderedBy': '6185512b11cd9b410c43833a',
                          });
                          await http.post(
                              "http://192.168.100.10:3000/api/v1/order/",
                              body: jsonStr,
                              headers: {
                                "Content-Type": "application/json"
                              }).then((result) {
                            print(result);
                          });
                        } catch (e) {
                          print(e);
                        }
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => Main(
                                      id: "6185512b11cd9b410c43833a",
                                      indexPage: 0,
                                    )));
                      },
                      child: Text('Pay Now'),
                    ),
                  )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
