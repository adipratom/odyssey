import 'package:flutter/material.dart';
import 'package:odyssey/pages/home.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/home',
  routes: {
    // '/': (context) => Loading(),
    '/home': (context) => Home(),
    // '/location': (context) => ChooseLocation(),
  },
));


