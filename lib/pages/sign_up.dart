import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return initWidget();
  }
}

Widget initWidget() {
  return Scaffold(
    resizeToAvoidBottomInset: false,
    body: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Color(0xFF21574A),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(0.0, 45.0, 15.0, 0.0),
          alignment: Alignment.topRight,
          child: Image.asset('assets/images/white_logo.png', width: 70.0),
        ),
        Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 200)),
              RichText(
                text: const TextSpan(
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
              ),
              Padding(padding: EdgeInsets.only(bottom: 50)),
              SizedBox(
                width: 300,
                child: TextFormField(
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: const InputDecoration(
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
              SizedBox(
                  width: 300,
                  child: TextFormField(
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.white,
                            width: 3.0,
                          )),
                          labelText: 'Password',
                          labelStyle: TextStyle(
                            fontFamily: 'KulimPark',
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: Colors.white60,
                          ),
                      )
                  )
                ),
              Padding(padding: EdgeInsets.only(bottom: 20)),
              Container(
                margin: EdgeInsets.only(right: 30),
                alignment: Alignment.centerRight,
                child: MaterialButton(
                  height: 45,
                  onPressed: () => {},
                  child: Image.asset('assets/images/submit.png', width: 45),
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 130)),
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
                        recognizer: new TapGestureRecognizer()..onTap = () => {

                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}
