// ignore_for_file: import_of_legacy_library_into_null_safe, avoid_print, prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, unnecessary_new

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:odyssey/main.dart';
import 'package:odyssey/pages/sign_in.dart';
import 'dart:ui';
import 'package:odyssey/model/login.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SignUpScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<SignUpScreen> {
  bool isHiddenPassword = true;
  String userId = '';
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  List<Login> _destinations = <Login>[];
  @override
  void initState() {
    super.initState();
    // _populateDestinations();
  }

  @override
  Widget build(BuildContext context) {
    Future<List<Login>> _fetchAllDestinations() async {
      final response =
          await http.post("http://192.168.100.10:3000/api/v1/auth/register",
              headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
              },
              body: jsonEncode(<String, String>{
                'email': emailController.text,
                'password': passwordController.text,
                'name': nameController.text,
              }));
      print(emailController.text + " EMAIL");
      print(passwordController.text + " PASSWORD");
      if (response.statusCode == 201) {
        final List<dynamic> result = jsonDecode(response.body);
        return result.map((item) => Login.fromJson(item)).toList();
      } else {
        throw Exception("Failed to register");
      }
    }

    void _populateDestinations() async {
      try {
        final destinations = await _fetchAllDestinations();
        setState(() {
          _destinations = destinations;
          print(_destinations);
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => Main(
                        id: _destinations[0].id,
                        indexPage: 0,
                      )));
        });
      } catch (Exception) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: const Text('Error Register New User'),
          duration: const Duration(seconds: 1),
        ));
      }
    }

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
                    child: Image.asset('assets/images/white_logo.png',
                        width: 70.0),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(bottom: 100)),
              //Text Container
              Container(
                  alignment: Alignment.center,
                  child: (RichText(
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
                  ))),
              Padding(padding: EdgeInsets.only(bottom: 50)),
              //Name Field
              SizedBox(
                width: 300,
                child: TextFormField(
                    controller: nameController,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.white, width: 1.5)),
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
                    controller: emailController,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.white, width: 1.5)),
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
                      controller: passwordController,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                      obscureText: isHiddenPassword,
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.white, width: 1.5)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.white,
                          width: 3.0,
                        )),
                        suffixIcon: InkWell(
                            onTap: _togglePasswordView,
                            child: (isHiddenPassword == true)
                                ? Icon(Icons.visibility, color: Colors.white)
                                : Icon(Icons.visibility_off,
                                    color: Colors.white)),
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
                    if (emailController.text.isEmpty ||
                        passwordController.text.isEmpty ||
                        nameController.text.isEmpty)
                      {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Empty Name, Email, or Password.')),
                        )
                      }
                    else if (!RegExp(
                            r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                        .hasMatch(emailController.text))
                      {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Email not valid.')),
                        )
                      }
                    else if (passwordController.text.length < 8)
                      {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Password is less than 8.')),
                        )
                      }
                    else
                      {_populateDestinations()}
                  },
                  child: Image.asset('assets/images/submit.png', width: 45),
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 60)),
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
        )),
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }
}
