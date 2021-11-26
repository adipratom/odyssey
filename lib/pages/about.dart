import 'package:flutter/material.dart';

class About extends StatefulWidget {
  const About({ Key? key }) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Stack(
      children: <Widget> [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
        ),
        Center(
          child: Image.asset('assets/images/odyssey-green.png', width: 220),
        ),
        Center(
          child: Text('odyssey', style: TextStyle(
            fontFamily: 'KulimPark', 
            fontWeight : FontWeight.w300, 
            height: 11, 
            fontSize: 40, 
            color:  Color.fromARGB(255, 33, 87, 74))) 
        ),
        Center(
          child: Text('v1.0', style: TextStyle(
            fontFamily: 'KulimPark', 
            fontWeight : FontWeight.w300, 
            height: 18, 
            fontSize: 30, 
            color:  Color.fromARGB(255, 33, 87, 74))) 
        ),
         Container(
           child: Center(
            child: Text('more info', style: TextStyle(
              fontFamily: 'KulimPark', 
              fontWeight : FontWeight.w500, 
              height: 32, 
              fontSize: 22, 
              color:  Color.fromARGB(255, 33, 87, 74))) 
        ),
         )
      ],
    ),
  );
  }
}