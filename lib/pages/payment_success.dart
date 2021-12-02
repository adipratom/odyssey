import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:odyssey/main.dart';
import 'package:url_launcher/url_launcher.dart';

class PaymentSuccess extends StatefulWidget {
  @override
  PaymentSuccessPage createState() => PaymentSuccessPage();
}

class PaymentSuccessPage extends State<PaymentSuccess> {
  final phoneNumber = '081388122001';
  @override
  Widget build(BuildContext context) {
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
                    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("ASDASD")));
                    Navigator.pop(context);
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => Main()));
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
                  //Container Purshace Succesful
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
                                    'Purchase Succesful',
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
                                            Text('Sat, 16 Oct 2021',
                                                style: TextStyle(
                                                  height: 2.5,
                                                  fontFamily: 'Poppins',
                                                )),
                                            Text('BCA Transfer',
                                                style: TextStyle(
                                                  height: 2.5,
                                                  fontFamily: 'Poppins',
                                                )),
                                            Text('Rp500.000',
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
                                  child: Text('Review Your Trip'),
                                ),
                              )),
                            ],
                          ),
                        )),
                        Container(
                            child: Image.asset('assets/images/check.png',
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
                            child: Image.asset(
                              'assets/images/sangiang.png',
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
                                text: const TextSpan(children: [
                                  TextSpan(
                                      text: 'Sangiang Island',
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
                                        text: '\nOct 21, 2021',
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
                                            text: '\nOct 23, 2021',
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
                                  child: Text(
                                    'Lead Guest',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Colors.black26
                                    )
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    'Satriyo Adipratomo',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Colors.black
                                    )
                                  ),
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
                                  child: Text(
                                    'Booked Capacity',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Colors.black26
                                    )
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    '2 Pax',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Colors.black
                                    )
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ],
                      ),
                  )),
                  Padding(padding: EdgeInsets.all(10)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
