// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:odyssey/model/profile_model.dart';
import 'package:odyssey/pages/add_destination.dart';

import '../main.dart';

// ignore: must_be_immutable
class GuideComponent extends StatelessWidget {
  late List<ProfileModel> profile;
  // ignore: use_key_in_widget_constructors
  GuideComponent({required this.profile});

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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Main(
                                  id: profile[0].id,
                                  indexPage: 3,
                                )));
                  },
                  icon: const Icon(Icons.chevron_left));
            },
          ),
          title: Text(title,
              style: const TextStyle(fontFamily: 'Poppins', fontSize: 20)),
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
                    image: NetworkImage(profile[0].headerPicture),
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
                        backgroundImage:
                            NetworkImage(profile[0].profilePicture),
                      ))
                ],
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: <Widget>[
              //     TextButton.icon(
              //       onPressed: () {},
              //       icon: Icon(Icons.store),
              //       label: Text(""),
              //       style: ButtonStyle(
              //           foregroundColor:
              //               MaterialStateProperty.all(Colors.black)),
              //     ),
              //     TextButton.icon(
              //       onPressed: () {},
              //       icon: Icon(Icons.settings),
              //       label: Text(""),
              //       style: ButtonStyle(
              //           foregroundColor:
              //               MaterialStateProperty.all(Colors.black)),
              //     ),
              //   ],
              // ),
              SizedBox(
                height: 50,
              ),
              ListTile(
                title: Text(profile[0].guideDetails!.guideName,
                    style: TextStyle(
                        fontFamily: "KulimPark",
                        fontSize: 30.0,
                        fontWeight: FontWeight.w600)),
                subtitle: Text('Guide',
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
                subtitle: Text(profile[0].guideDetails!.description,
                    style: TextStyle(fontFamily: "Poppins")),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => AddDestination(id: profile[0].id)));
          },
          child: const Icon(Icons.add),
          backgroundColor: Colors.green,
        ),
      ),
    );
  }
}
