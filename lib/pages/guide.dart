import 'package:flutter/material.dart';
import 'package:odyssey/pages/profile.dart';

import '../main.dart';

class Guide extends StatefulWidget {
  const Guide({Key? key}) : super(key: key);

  @override
  _GuideState createState() => _GuideState();
}

class _GuideState extends State<Guide> {
  @override
  Widget build(BuildContext context) {
    const title = "Guide Profile";
    return MaterialApp(
      title: title,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
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
          title: const Text(title,
              style: TextStyle(fontFamily: 'Poppins', fontSize: 20)),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Stack(
                overflow: Overflow.visible,
                // alignment: Alignment.center,
                children: <Widget>[
                  Image(
                    image: NetworkImage(
                        'https://cdn.wallpapersafari.com/12/28/0objwK.jpg'),
                    height: MediaQuery.of(context).size.height / 4,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                      left: 10.0,
                      bottom: -50.0,
                      child: CircleAvatar(
                        radius: 80,
                        backgroundColor: Colors.white,
                        backgroundImage: NetworkImage(
                            'https://spesialis1.orthopaedi.fk.unair.ac.id/wp-content/uploads/2021/02/depositphotos_39258143-stock-illustration-businessman-avatar-profile-picture.jpg'),
                      ))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  TextButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.store),
                    label: Text(""),
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all(Colors.black)),
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.settings),
                    label: Text(""),
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all(Colors.black)),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                title: Text('Fatma Putrie',
                    style: TextStyle(
                        fontFamily: "KulimPark",
                        fontSize: 30.0,
                        fontWeight: FontWeight.w600)),
                subtitle: Text('Adventurer',
                    style: TextStyle(
                        fontFamily: "KulimPark",
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600)),
              ),
              SizedBox(
                height: 20,
              ),
              ListTile(
                title: Text("Description:",
                    style: TextStyle(
                        fontFamily: "KulimPark",
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600)),
                subtitle: Text(
                    "Lorem ipsum dolor sit amet,consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
                    style: TextStyle(fontFamily: "Poppins")),
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                title: Text("Favorites:",
                    style: TextStyle(
                        fontFamily: "KulimPark",
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
