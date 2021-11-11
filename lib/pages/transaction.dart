import 'package:flutter/material.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({ Key? key }) : super(key: key);

  @override
  _TransactionPageState createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text("Transaction Page"),
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
            Navigator.pushReplacementNamed(context, '/');
          }
          if(index == 2) {
            Navigator.pushReplacementNamed(context, '/favorite');
          }
          if(index == 3) {
            Navigator.pushReplacementNamed(context, '/profile');
          }
        },
      ),
    );
  }
}