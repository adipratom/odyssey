import 'package:flutter/material.dart';

class Favorite extends StatefulWidget {
  const Favorite({ Key? key }) : super(key: key);

  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  int _currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text("Favorite Page"),
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
          if(index == 1) {
            Navigator.pushReplacementNamed(context, '/transaction');
          }
          if(index == 3) {
            Navigator.pushReplacementNamed(context, '/profile');
          }
        },
      ),
    );
  }
}