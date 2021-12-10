// ignore_for_file: camel_case_types, avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class orderDetail extends StatefulWidget {
  const orderDetail({Key? key}) : super(key: key);

  @override
  _orderDetailState createState() => _orderDetailState();
}

class _orderDetailState extends State<orderDetail> {
  @override
  Widget build(BuildContext context) {
    return buildOrderDetail(context);
  }

  Widget buildOrderDetail(context) => Container(
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
                child: Image.asset(
                  'assets/images/sangiang.png',
                  fit: BoxFit.cover,
                  height: 130,
                ),
              )),
              Padding(padding: EdgeInsets.only(bottom: 10)),
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
                          )),
                      TextSpan(
                          text: '\nRp250.000/pax',
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
                              borderRadius: BorderRadius.circular(30.0)),
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
      );
}
