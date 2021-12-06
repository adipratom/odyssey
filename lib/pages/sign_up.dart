import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:odyssey/main.dart';
import 'package:odyssey/pages/sign_in.dart';
import 'dart:ui';

class SignUpScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<SignUpScreen> {
  bool isHiddenPassword = true;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFF21574A),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //logo
                Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0.0, 25.0, 15.0, 0.0),
                      alignment: Alignment.topRight,
                      child: Image.asset('assets/images/white_logo.png', width: 70.0),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 100)),
                //Text Container
                Container(
                  alignment: Alignment.center,
                  child:(
                    RichText(
                      text: TextSpan(
                        text: 'Ahoy, Travelers!',
                        style: TextStyle(
                            fontFamily: 'KulimPark',
                            fontWeight: FontWeight.w600,
                            fontSize: 44,
                            color: Colors.white),
                        children: <TextSpan>[
                          TextSpan(
                            text: '\nSign up before boarding with us',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                                fontSize: 20)),
                        ],
                      ),
                    )
                  )
                ),
                Padding(padding: EdgeInsets.only(bottom: 50)),
                //Name Field
                SizedBox(
                  width: 300,
                  child: TextFormField(
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: InputDecoration(
                          focusedBorder:UnderlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 1.5)),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.white,
                            width: 3.0,
                          )),
                          labelText: 'Name',
                          labelStyle: TextStyle(
                            fontFamily: 'KulimPark',
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: Colors.white60,
                          ))),
                ),
                //email field
                SizedBox(
                  width: 300,
                  child: TextFormField(
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: InputDecoration(
                          focusedBorder:UnderlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 1.5)),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.white,
                            width: 3.0,
                          )),
                          labelText: 'Email',
                          labelStyle: TextStyle(
                            fontFamily: 'KulimPark',
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: Colors.white60,
                          ))),
                ),
                //password field
                SizedBox(
                    width: 300,
                    child: TextFormField(
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                        obscureText: isHiddenPassword,
                        decoration: InputDecoration(
                          focusedBorder:UnderlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.white,
                              width: 1.5)),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.white,
                            width: 3.0,
                          )),
                          suffixIcon: InkWell(
                            onTap: _togglePasswordView,
                            child: (isHiddenPassword == true) ? Icon(Icons.visibility,color: Colors.white): Icon(Icons.visibility_off,color: Colors.white)
                          ),
                          labelText: 'Password',
                          labelStyle: TextStyle(
                            fontFamily: 'KulimPark',
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: Colors.white60,
                          ),
                        ))),
                Padding(padding: EdgeInsets.only(bottom: 20)),
                //Enter button
                Container(
                  margin: EdgeInsets.only(right: 30),
                  alignment: Alignment.centerRight,
                  child: MaterialButton(
                    height: 45,
                    onPressed: () => {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => Main()))
                    },
                    child: Image.asset('assets/images/submit.png', width: 45),
                  ),
                ),
                Padding(padding: EdgeInsets.only(bottom: 95)),
                //Bottom text
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Already have an account?',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        color: Colors.white),
                    children: <TextSpan>[
                      TextSpan(
                        text: '\nLogin',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 18,
                        ),
                        recognizer: new TapGestureRecognizer()
                          ..onTap = () => {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            SignInScreen()))
                              },
                      ),
                          ],
                        ),
                      ),
                Padding(padding: EdgeInsets.only(bottom: 31.5)),
              ],
            ),
          )
        ),
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }
}
