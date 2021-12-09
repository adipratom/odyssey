// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:odyssey/main.dart';
import 'package:odyssey/model/order.dart';
import 'package:odyssey/pages/payment_fail.dart';
import 'package:odyssey/pages/transaction.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

class PaymentPending extends StatefulWidget {
  late final String id;
  late final String name;
  late final String dueDate;
  late final String startDate;
  late final String finishedDate;
  late final String status;
  late final int price;
  late final String photo;
  late final int desPrice;

  // ignore: non_constant_identifier_names
  PaymentPending({
    required this.id,
    required this.name,
    required this.dueDate,
    required this.startDate,
    required this.finishedDate,
    required this.status,
    required this.price,
    required this.photo,
    required this.desPrice,
  });
  @override
  PaymentPendingPage createState() => PaymentPendingPage();
}

class PaymentPendingPage extends State<PaymentPending> {
  final phoneNumber = '081388122001';
  cancelPopUpFunc(context) {
    return showDialog(
        context: context,
        builder: (context) {
          return Center(
              child: Material(
            type: MaterialType.transparency,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: Colors.white),
              padding: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width * 0.8,
              height: 180,
              child: Column(
                children: [
                  Container(
                    child: Text(
                      'Are you sure you want to cancel your booking?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                          fontFamily: 'KulimPark',
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //Tombol Yes
                        Container(
                          height: MediaQuery.of(context).size.height * 0.065,
                          width: MediaQuery.of(context).size.width * 0.34,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Color(0xff920000),
                                  alignment: Alignment.center,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  textStyle: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                      fontSize: 20)),
                              onPressed: () async {
                                try {
                                  String jsonStr =
                                      jsonEncode({'status': 'failed'});
                                  await http.put(
                                      "http://192.168.100.1:3000/api/v1/order/${widget.id}",
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
                                        builder: (BuildContext context) =>
                                            PaymentFailed(
                                                id: widget.id,
                                                name: widget.name,
                                                dueDate: widget.dueDate,
                                                startDate: widget.startDate,
                                                finishedDate:
                                                    widget.finishedDate,
                                                status: widget.status,
                                                price: widget.price,
                                                photo: widget.photo,
                                                desPrice: widget.desPrice)));
                              },
                              child: Text('Yes')),
                        ),
                        //Tombol No
                        Container(
                          height: MediaQuery.of(context).size.height * 0.065,
                          width: MediaQuery.of(context).size.width * 0.34,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Color(0xff21574A),
                                  alignment: Alignment.center,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  textStyle: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                      fontSize: 20)),
                              onPressed: () {},
                              child: Text('No')),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ));
        });
  }

  @override
  Widget build(BuildContext context) {
    var dateDue = DateTime.parse('${widget.dueDate}');
    var dateStart = dateDue.subtract(const Duration(days: 3));
    var totalPerson = widget.price / widget.desPrice;
    const appTitle = 'Order Details';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => Main(
                                  id: "6185512b11cd9b410c43833a",
                                  indexPage: 0,
                                )));
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
                  //Container Wait For Payment
                  Container(
                    child: Stack(
                      children: [
                        Container(
                            child: Container(
                          padding: EdgeInsets.fromLTRB(15, 25, 15, 25),
                          alignment: Alignment.topCenter,
                          constraints: BoxConstraints(maxWidth: 355),
                          decoration: BoxDecoration(
                              color: Color(0x40C4C4C4),
                              borderRadius: BorderRadius.circular(15.0)),
                          child: Column(
                            children: <Widget>[
                              //Purchase Successful
                              Container(
                                  padding: EdgeInsets.only(top: 20, bottom: 20),
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Waiting For Payment',
                                    style: TextStyle(
                                        fontFamily: 'KulimPark',
                                        fontWeight: FontWeight.w700,
                                        fontSize: 24),
                                  )),
                              //Bagian Tengah
                              Container(
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      //Bagian Kiri
                                      Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('Purchased on',
                                                style: TextStyle(
                                                  height: 2.5,
                                                  fontFamily: 'Poppins',
                                                )),
                                            Text('Payment Method',
                                                style: TextStyle(
                                                  height: 2.5,
                                                  fontFamily: 'Poppins',
                                                )),
                                            Text('Price details',
                                                style: TextStyle(
                                                  height: 2.5,
                                                  fontFamily: 'Poppins',
                                                ))
                                          ]),
                                      //Bagian Kanan
                                      Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                                dateStart
                                                    .toIso8601String()
                                                    .split("T")[0],
                                                style: TextStyle(
                                                  height: 2.5,
                                                  fontFamily: 'Poppins',
                                                )),
                                            Text('BCA Transfer',
                                                style: TextStyle(
                                                  height: 2.5,
                                                  fontFamily: 'Poppins',
                                                )),
                                            Text('Rp ${widget.price}',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  height: 2.5,
                                                  fontFamily: 'Poppins',
                                                ))
                                          ])
                                    ]),
                              ),
                              Padding(padding: EdgeInsets.only(bottom: 15)),
                              //Button Review
                              Container(
                                  child: Container(
                                height: 40,
                                width: double.infinity,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Color(0xff21574A),
                                    alignment: Alignment.center,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    textStyle: const TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                        fontSize: 15),
                                  ),
                                  onPressed: () => {},
                                  child: Text('Payment Verification'),
                                ),
                              )),
                            ],
                          ),
                        )),
                        Container(
                            child: Image.asset('assets/images/pending.png',
                                width: 75),
                            alignment: Alignment.centerRight,
                            padding: EdgeInsets.all(10)),
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 15)),
                  //Teks Product Details
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Product Details',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: 20),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 15)),
                  //Container Product Details
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
                          //gambar destinasi
                          Container(
                              child: ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: Image.network(
                              widget.photo,
                              fit: BoxFit.cover,
                              height: 130,
                            ),
                          )),
                          Padding(padding: EdgeInsets.only(bottom: 10)),
                          //Detail Tulisan destinasi sama provided by siapa
                          Container(
                              alignment: Alignment.centerLeft,
                              child: RichText(
                                textAlign: TextAlign.left,
                                text: TextSpan(children: [
                                  TextSpan(
                                      text: '${widget.name}',
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
                                      text: 'Nusa Travel Agent',
                                      style: TextStyle(
                                        height: 2.5,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                        fontSize: 13,
                                      ))
                                ]),
                              )),
                          Padding(padding: EdgeInsets.only(bottom: 10)),
                          //Dua tombol kontak dan view itenary
                          Container(
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                //Contact Guide button
                                Container(
                                  height: 40,
                                  width: 150,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Color(0xff9CA18D),
                                        alignment: Alignment.center,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        textStyle: const TextStyle(
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                            fontSize: 12),
                                      ),
                                      onPressed: () async {
                                        launch('tel://$phoneNumber');
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Icon(
                                            Icons.phone,
                                            color: Colors.white,
                                            size: 13,
                                          ),
                                          Text(' Contact Guide'),
                                        ],
                                      )),
                                ),
                                //View Destination button
                                Container(
                                  height: 40,
                                  width: 150,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Color(0xff9CA18D),
                                      alignment: Alignment.center,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      textStyle: const TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                          fontSize: 12),
                                    ),
                                    onPressed: () => {},
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Icon(
                                          Icons.search,
                                          color: Colors.white,
                                          size: 15,
                                        ),
                                        Text(' View Destination'),
                                      ],
                                    ),
                                  ),
                                ),
                              ])),
                          //Garis divider
                          Divider(
                            color: Colors.black26,
                            thickness: 1.4,
                            height: 30.0,
                          ),
                          //Kapan Start sama End
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                        text: 'Start From',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black38,
                                          fontSize: 13,
                                        )),
                                    TextSpan(
                                        text:
                                            '\n${widget.startDate.split("T")[0]}',
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
                                            text: 'End',
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black38,
                                              fontSize: 13,
                                            )),
                                        TextSpan(
                                            text:
                                                '\n${widget.finishedDate.split("T")[0]}',
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
                  //Teks Adeventurer Information
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Aventurer Information',
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: 20),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 15)),
                  //Adevntuter info container
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
                        //atas
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text('Lead Guest',
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color: Colors.black26)),
                              ),
                              Container(
                                child: Text('Muhammad Hadi',
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color: Colors.black)),
                              ),
                            ],
                          ),
                        ),
                        //pembatas
                        Divider(
                          color: Colors.black26,
                          thickness: 1.4,
                          height: 30.0,
                        ),
                        //bawah
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text('Booked Capacity',
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color: Colors.black26)),
                              ),
                              Container(
                                child: Text('${totalPerson} Pax',
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color: Colors.black)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
                  Padding(padding: EdgeInsets.all(10)),
                  //Cancel Booking
                  Container(
                      child: Container(
                    height: 60,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xff920000),
                        alignment: Alignment.center,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        textStyle: const TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 20),
                      ),
                      onPressed: () => {cancelPopUpFunc(context)},
                      child: Text('Cancel Booking'),
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
