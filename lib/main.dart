import 'package:flutter/material.dart';
import 'package:odyssey/pages/favorite.dart';
import 'package:odyssey/pages/home.dart';
import 'package:odyssey/pages/profile.dart';
import 'package:odyssey/pages/transaction.dart';

void main() => runApp(new MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => Home(),
    '/favorite': (context) => Favorite(),
    '/transaction': (context) => TransactionPage(),
    '/profile': (context) => Profile(),
  },
));


