import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:odyssey/main.dart';
import 'dart:io';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:odyssey/pages/profile.dart';
import 'package:http/http.dart' as http;

void main() => runApp(const EditProfile());

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    const appTitle = 'Edit Profile';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          // leading: const Icon(Icons.chevron_left),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                  onPressed: () {
                    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("ASDASD")));
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Main()));
                  },
                  icon: Icon(Icons.chevron_left));
            },
          ),
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
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();
  Dio dio = new Dio();
  late File? _image;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });

    try {
      String filename = image.path.split('/').last;
      FormData formData = new FormData.fromMap({
        "profileImage": await MultipartFile.fromFile(image.path,
            filename: filename, contentType: MediaType('image', 'png')),
        "type": "image/png"
      });
      Response response = await dio.put(
          "http://192.168.0.20:3000/api/v1/users/6185512b11cd9b410c43833a",
          data: formData,
          options: Options(headers: {
            "accept": "*/*",
            'Content-Type': "multipart/form-dataa",
          }));
    } catch (e) {
      print(e);
    }
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
                    // child: _image == null
                    //     ? Image.asset('assets/images/profile.jpg')
                    //     : Image.file(_image!),
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
                child: Text('Change Profile Picture',
                    style: TextStyle(fontFamily: 'Poppins', fontSize: 14)),
              ),
            ),
            Container(
              child: Text('What should we call you?',
                  style: TextStyle(fontFamily: 'Poppins', fontSize: 14)),
              padding: EdgeInsets.fromLTRB(5, 20, 0, 5),
            ),
            TextFormField(
              controller: nameController,
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
                  style: TextStyle(fontFamily: 'Poppins', fontSize: 14)),
              padding: EdgeInsets.fromLTRB(5, 20, 0, 5),
            ),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                fillColor: Color.fromARGB(100, 196, 196, 196),
                filled: true,
                hintText: 'Enter an email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            Container(
              child: Text('What is your phone number?',
                  style: TextStyle(fontFamily: 'Poppins', fontSize: 14)),
              padding: EdgeInsets.fromLTRB(5, 20, 0, 5),
            ),
            TextFormField(
              controller: phoneController,
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
                  style: TextStyle(fontFamily: 'Poppins', fontSize: 14)),
              padding: EdgeInsets.fromLTRB(5, 20, 0, 5),
            ),
            TextFormField(
              controller: addressController,
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
                  style: TextStyle(fontFamily: 'Poppins', fontSize: 14)),
              padding: EdgeInsets.fromLTRB(5, 20, 0, 5),
            ),
            TextFormField(
              controller: descriptionController,
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
              width: 320.0,
              padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
              child: ElevatedButton(
                onPressed: () async {
                  // Validate returns true if the form is valid, or false otherwise.
                  try {
                    String jsonStr = jsonEncode({
                      'name': nameController.text,
                      'address': addressController.text,
                      'description': descriptionController.text,
                      'phone': phoneController.text,
                    });
                    await http.put("http://192.168.100.10:3000/api/v1/users/6185512b11cd9b410c43833a",
                    body: jsonStr, headers: { "Content-Type" : "application/json"}).then((result) {
                      print(result);
                    });
                  } catch (e) {
                    print(e);
                  }
                  if (_formKey.currentState!.validate()) {
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );
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
