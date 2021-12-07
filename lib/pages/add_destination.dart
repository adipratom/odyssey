import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:odyssey/main.dart';
import 'dart:io';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:odyssey/pages/profile.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:async/async.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

void main() => runApp(const AddDestination());

class AddDestination extends StatelessWidget {
  const AddDestination({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Add Destination';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: const Icon(Icons.chevron_left),
          title: const Text(appTitle,
              style: TextStyle(fontFamily: 'Poppins', fontSize: 20)),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
          child: MyCustomForm(),
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
  late File _image;
  TextEditingController nameController = TextEditingController();
  // TextEditingController typeController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController benefitsController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();
  List<String> optionsTrip = <String>['Open Trip', 'Private Trip', 'Honeymoon'];
  String dropdownValueTrip = 'Open Trip';
  List<String> optionsActivity = <String>[
    'Leisurely',
    'Moderate',
    'Challenging'
  ];
  String dropdownValueActivity = 'Leisurely';

  Future getImage() async {
    String responseString = '';
    final picker = ImagePicker();
    var image = await picker.getImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    ); // <- Reduce Image quality);

    setState(() {
      if (image != null) {
        _image = File(image.path);
        print(_image);
        // upload(_image);
      } else {
        print('No image selected.');
      }
    });
  }

  Future upload() async {
    String responseString = '';
    final file = File(_image.path);
    print(file);
    print(file.path);
    // Set URI
    final uri = Uri.parse('http://192.168.100.10:3000/api/v1/destination');
    // Set the name of file parameter
    final parameter = 'photo';

    // Upload
    final request = http.MultipartRequest('POST', uri)
      ..files.add(await http.MultipartFile.fromPath('photo', file.path,
          contentType: new MediaType('image', 'jpeg')));
    request.fields['name'] = nameController.text;
    request.fields['type'] = dropdownValueTrip.toLowerCase();
    request.fields['activityLevel'] = dropdownValueActivity.toLowerCase();
    request.fields['description'] = descriptionController.text;
    request.fields['benefits'] = benefitsController.text;
    request.fields['price'] = priceController.text;
    request.fields['guide'] = "6185512b11cd9b410c43833a";

    final response = await request.send();
    if (response.statusCode == 201) {
      responseString = String.fromCharCodes(await response.stream.toBytes());
    }
    print(responseString);
  }

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
                child: GestureDetector(
              onTap: () {
                getImage();
              },
              child: Center(
                child: CircleAvatar(
                  radius: 50.0,
                  child: ClipRRect(
                    child: Image.asset('assets/images/profile.jpg'),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
                //  Image.asset('../assets/images/profile.jpg')
              ),
            )),
            Container(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Center(
                child: Text('Add Destination Picture',
                    style: TextStyle(fontFamily: 'Poppins', fontSize: 14)),
              ),
            ),
            Container(
              child: Text('What is the adventure`s name?',
                  style: TextStyle(fontFamily: 'Poppins', fontSize: 14)),
              padding: EdgeInsets.fromLTRB(5, 20, 0, 5),
            ),
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                fillColor: Color.fromARGB(100, 196, 196, 196),
                filled: true,
                hintText: 'Enter the adventure name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            Container(
              child: Text('What is the adventure`s price?',
                  style: TextStyle(fontFamily: 'Poppins', fontSize: 14)),
              padding: EdgeInsets.fromLTRB(5, 20, 0, 5),
            ),
            TextFormField(
              controller: priceController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                fillColor: Color.fromARGB(100, 196, 196, 196),
                filled: true,
                hintText: 'Enter the adventure name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            Container(
              child: Text('Choose the type and activity level:',
                  style: TextStyle(fontFamily: 'Poppins', fontSize: 14)),
              padding: EdgeInsets.fromLTRB(5, 20, 0, 5),
            ),
            Container(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(100, 196, 196, 196),
                      borderRadius: BorderRadius.circular(10)),
                  width: 150,
                  child: Flexible(
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(5, 0, 10, 0),
                        child: DropdownButtonFormField(
                          isDense: true,
                          value: dropdownValueTrip,
                          items: optionsTrip
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                                value: value,
                                child: value == dropdownValueTrip
                                    ? Text(
                                        value,
                                        style: TextStyle(color: Colors.black),
                                      )
                                    : Text(value));
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValueTrip = newValue!;
                            });
                          },
                          dropdownColor: Colors.white,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          selectedItemBuilder: (BuildContext context) {
                            return optionsTrip.map((String value) {
                              return Text(dropdownValueTrip,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    // fontWeight: FontWeight.bold
                                  ));
                            }).toList();
                          },
                        )),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(100, 196, 196, 196),
                      borderRadius: BorderRadius.circular(10)),
                  width: 150,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(5, 0, 10, 0),
                    child: Flexible(
                      child: DropdownButtonFormField(
                        isDense: true,
                        value: dropdownValueActivity,
                        items: optionsActivity
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                              value: value,
                              child: value == dropdownValueActivity
                                  ? Text(
                                      value,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Poppins"),
                                    )
                                  : Text(value,
                                      style: TextStyle(fontFamily: "Poppins")));
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValueActivity = newValue!;
                          });
                        },
                        dropdownColor: Colors.white,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        selectedItemBuilder: (BuildContext context) {
                          return optionsActivity.map((String value) {
                            return Text(dropdownValueActivity,
                                style: const TextStyle(
                                  color: Colors.black,
                                  // fontWeight: FontWeight.bold
                                ));
                          }).toList();
                        },
                      ),
                    ),
                  ),
                ),
              ],
            )),
            Container(
              child: Text('What is the description?',
                  style: TextStyle(fontFamily: 'Poppins', fontSize: 14)),
              padding: EdgeInsets.fromLTRB(5, 20, 0, 5),
            ),
            TextFormField(
              controller: descriptionController,
              maxLines: 3,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(10, 20, 0, 10),
                fillColor: Color.fromARGB(100, 196, 196, 196),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                hintText: 'Enter description',
              ),
            ),
            Container(
              child: Text('What will adventures have?',
                  style: TextStyle(fontFamily: 'Poppins', fontSize: 14)),
              padding: EdgeInsets.fromLTRB(5, 20, 0, 5),
            ),
            TextFormField(
              controller: benefitsController,
              maxLines: 3,
              decoration: InputDecoration(
                fillColor: Color.fromARGB(100, 196, 196, 196),
                contentPadding: EdgeInsets.fromLTRB(10, 20, 0, 10),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                hintText: "Enter the destination's itinerary",
              ),
            ),
            Container(
              width: 320.0,
              padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
              child: ElevatedButton(
                onPressed: () {
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState!.validate()) {
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );
                    upload();
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  primary: Color.fromARGB(255, 204, 164, 137),
                  onPrimary: Colors.white,
                ),
                child: Text(
                  'Submit',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
