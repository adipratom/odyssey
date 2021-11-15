import 'package:flutter/material.dart';
import 'package:odyssey/pages/favorite.dart';
import 'package:odyssey/pages/home.dart';
import 'package:odyssey/pages/profile.dart';
import 'package:odyssey/pages/transaction.dart';
import 'package:odyssey/pages/splash.dart';
import 'package:odyssey/pages/sign_up.dart';
import 'package:odyssey/pages/sign_in.dart';

void main() => runApp(new MaterialApp(
  initialRoute: '/sign_in',
  routes: {
    '/': (context) => Main(),
    //'/sign_up': (context) => SignUpScreen(),
    '/sign_in': (context) => SignInScreen(),
    // '/splash': (context) => SplashScreen(),
  },
));

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  int _currentIndex = 0;

  List<Widget> pageList = <Widget>[
    Home(),
    TransactionPage(),
    Favorite(),
    Profile(),
  ];

  void onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Color(0xFF21574A),
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
              backgroundColor: Colors.grey),
          BottomNavigationBarItem(
              icon: Icon(Icons.payment),
              label: "Search",
              backgroundColor: Colors.grey),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "Favorite",
              backgroundColor: Colors.grey),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
              backgroundColor: Colors.grey),
        ],
        onTap: onTap,
      ),
    );
  }
}
