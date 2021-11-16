import 'package:flutter/material.dart';

void main() => runApp(const EditGuide());

class EditGuide extends StatelessWidget {
  const EditGuide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Edit Agent';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        backgroundColor:Colors.white ,
        appBar: AppBar(
          leading: const Icon(Icons.chevron_left),
          title: const Text(appTitle,
              style: TextStyle(fontFamily: 'KulimPark', fontSize: 20)),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
          child:MyCustomForm(), 
        ), 
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class. This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Container(
      padding: EdgeInsets.all(26),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
             child: Center(
               child:
               Image.asset('../assets/images/profile.jpg')
             )     
            ),
            Container(
              child: Center(
                child: Text('Change Profile Picture',
                    style: TextStyle(fontFamily: 'KulimPark', fontSize: 14)),
              ),
            ),
            Container(
              child: Text('What should we call you?',
                  style: TextStyle(fontFamily: 'KulimPark', fontSize: 14)),
              padding: EdgeInsets.fromLTRB(5, 20, 0, 5),
            ),

            TextFormField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                fillColor: Color.fromARGB(100, 196, 196, 196),
                filled: true,
                hintText: 'Enter your name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            Container(
              child: Text('What is your email?',
                  style: TextStyle(fontFamily: 'KulimPark', fontSize: 14)),
              padding: EdgeInsets.fromLTRB(5, 20, 0, 5),
            ),
            TextFormField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                fillColor: Color.fromARGB(100, 196, 196, 196),
                filled: true,
                hintText: 'Enter a phone number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            Container(
              child: Text('What is your phone number?',
                  style: TextStyle(fontFamily: 'KulimPark', fontSize: 14)),
              padding: EdgeInsets.fromLTRB(5, 20, 0, 5),
            ),

            TextFormField(
              decoration: InputDecoration(
                fillColor: Color.fromARGB(100, 196, 196, 196),
                contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                hintText: 'Enter your phone number',
              ),
            ),
            Container(
              child: Text('What is your address?',
                  style: TextStyle(fontFamily: 'KulimPark', fontSize: 14)),
              padding: EdgeInsets.fromLTRB(5, 20, 0, 5),
            ),
            TextFormField(
              maxLines: 3,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(10, 20, 0, 10),
                fillColor: Color.fromARGB(100, 196, 196, 196),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                hintText: 'Enter your address',
              ),
            ),
            Container(
              child: Text('What are words to describe you?',
                  style: TextStyle(fontFamily: 'KulimPark', fontSize: 14)),
              padding: EdgeInsets.fromLTRB(5, 20, 0, 5),
            ),
            
            TextFormField(
              maxLines: 3,
              decoration: InputDecoration(
                fillColor: Color.fromARGB(100, 196, 196, 196),
                contentPadding: EdgeInsets.fromLTRB(10, 20, 0, 10),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                hintText: 'Enter description',
              ),
            ),
            Container(
              child: Text('What is your bank account?',
                  style: TextStyle(fontFamily: 'KulimPark', fontSize: 14)),
              padding: EdgeInsets.fromLTRB(5, 20, 0, 5),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[ 
                  Container(
                    width: 120,
                    child: Flexible(child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          fillColor: Color.fromARGB(100, 196, 196, 196),
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          hintText: 'Enter your bank account',
                          ), 
                      ),)),
                  ),
                  
                  Flexible(child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        fillColor: Color.fromARGB(100, 196, 196, 196),
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        hintText: 'Enter your bank account',
                        ), 
                    ),)),
                
              ],
              )
            ),
           
            Container(
            width: 320.0,
            padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
            child: ElevatedButton(
              onPressed: () {  },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 20),
                primary: Color.fromARGB(255, 204,164,137),
                onPrimary: Colors.white,
              ),
              child: Text(
                'Submit',
                style: TextStyle(color: Colors.white,fontFamily: 'KulimPark', fontSize: 14, fontWeight: FontWeight.w700), 
              ),
            ),
            ),
          ],
        ),
      ),
    );
  }
}
