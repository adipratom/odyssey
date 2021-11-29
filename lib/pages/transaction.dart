import 'package:flutter/material.dart';
import 'package:odyssey/components/transactionCard.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  _TransactionPageState createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return DefaultTabController(
      length: 2,
      child: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Container(
              height: 48,
              decoration: BoxDecoration(
                  color: Color(0xff21574A),
                  // color: Colors.grey,
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TabBar(
                    indicator: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    tabs: [
                      Tab(
                        child: Text(
                          'Adventure',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              color: Color(0xff21574A)),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Guide',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600, 
                              color: Color(0xff21574A)),
                        ),
                      ),
                    ]),
              ),
            ),
            Container(
                height: size.height * 0.7,
                child: TabBarView(
                  children: [
                    Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              TransactionCard(context),
                              TransactionCard(context),
                              TransactionCard(context),
                            ],
                          ),
                        )),
                    Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              TransactionCard(context),
                              TransactionCard(context),
                              TransactionCard(context),
                            ],
                          ),
                        )),
                  ],
                ))
          ],
        ),
      )),
    );
  }
}
