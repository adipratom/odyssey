import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:odyssey/main.dart';
import 'package:odyssey/pages/payment_success.dart';
import 'package:odyssey/pages/payment_pending.dart';
import 'package:odyssey/pages/payment_fail.dart';

class paymentDetail extends StatefulWidget {
  const paymentDetail({Key? key}) : super(key: key);

  @override
  _paymentDetailState createState() => _paymentDetailState();
}

class _paymentDetailState extends State<paymentDetail> {
  @override
  Widget build(BuildContext context) {
    return buildPaymentDetail(context);
  }

  Widget buildPaymentDetail(context) => Container(
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
                        text: const TextSpan(children: [
                      TextSpan(
                          text: 'Sangiang Island',
                          style: TextStyle(
                            height: 1.5,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: 13,
                          )),
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
                        text: const TextSpan(children: [
                          TextSpan(
                              text: '2 Guest',
                              style: TextStyle(
                                height: 1.5,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 13,
                              )),
                          TextSpan(
                              text: '\nRp500.000',
                              style: TextStyle(
                                height: 2,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                fontSize: 16,
                              )),
                          TextSpan(
                              text: '\nMake sure the amount matches up',
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
        ),
      );
}
