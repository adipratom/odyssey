import 'package:flutter/material.dart';
import 'package:odyssey/pages/favorite.dart';
import 'package:odyssey/pages/home.dart';
import 'package:odyssey/pages/transaction.dart';
import 'package:odyssey/pages/profile.dart';

class Profile extends StatefulWidget {
  const Profile({ Key? key }) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int _currentIndex = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text("Profile Page"),
      ),
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
              title: Text("Home"),
              backgroundColor: Colors.grey),
          BottomNavigationBarItem(
              icon: Icon(Icons.payment),
              title: Text("Search"),
              backgroundColor: Colors.grey),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              title: Text("Profile"),
               backgroundColor: Colors.grey),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text("Settings"),
              backgroundColor: Colors.grey),
        ],
        onTap: (index) {
          setState(() => _currentIndex = index);
          if(index == 0) {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
          }
          if(index == 2) {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => TransactionPage()));
          }
          if(index == 3) {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Favorite()));
          }
        },
      ),
    );
  }
}