import 'package:flutter/material.dart';
import 'package:odyssey/pages/sign-in.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = Duration(seconds: 2);
    return new Timer(duration, signInRoute);
  }

  signInRoute(){
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) => SignInScreen()
    ));
  }

  @override
  Widget build(BuildContext context) {
    return initWidget();
  }
}

initWidget() {
  return Scaffold(
    body: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Color(0xFF21574A),
          ),
        ),
        Center(
          child: Container(
            child: Image.asset("white_logo.png"),
          ),
        )
      ],
    ),
  );
}
