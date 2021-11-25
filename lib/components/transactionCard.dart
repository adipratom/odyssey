import 'package:flutter/material.dart';

Widget TransactionCard(BuildContext context) {
  return Center(
    child: Card(
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
          child: Column(
            children: [
              const ListTile(
                title: Text('The Enchanted Nightingale'),
                subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  TextButton(
                    child: const Text('BUY TICKETS'),
                    onPressed: () {/* ... */},
                  ),
                  const SizedBox(width: 8),
                  TextButton(
                    child: const Text('LISTEN'),
                    onPressed: () {/* ... */},
                  ),
                  const SizedBox(width: 8),
                ],
              ),
            ],
          )),
    ),
  );
}
