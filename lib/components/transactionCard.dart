import 'package:flutter/material.dart';

Widget TransactionCard(BuildContext context) {
  return Center(
    child: Card(
      color: Color(0x40C4C4C4),
      child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            print('Card tapped.');
          },
          // child: const SizedBox(
          //   width: 300,
          //   height: 100,
          //   child: Text('A card that can be tapped'),
          // ),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        'assets/images/home/badui.png',
                        width: 70,
                        fit: BoxFit.cover,
                      ),
                    )),
                ),
                Expanded(
                  flex: 6,
                  child: Column(
                    children: [
                      Padding(padding: EdgeInsets.only(bottom: 15)),
                      ListTile(
                        title: Text(
                          'Lembang', 
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                          )),
                        subtitle: Text(
                          'Provided by Nusa Travel Agent',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            fontSize: 13
                          )),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            'Waiting For Payment'
                          ),
                          const SizedBox(width: 8),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    ),
  );
}
