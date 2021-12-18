// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:odyssey/model/profile_model.dart';
import 'package:odyssey/pages/guide.dart';
import 'package:odyssey/pages/settings.dart';

class ProfileComponent extends StatelessWidget {
  late List<ProfileModel> profile;
  ProfileComponent({required this.profile});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Stack(
          // ignore: deprecated_member_use
          overflow: Overflow.visible,
          // alignment: Alignment.center,
          children: <Widget>[
            Image(
              image: NetworkImage(profile[0].profilePicture),
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
                  backgroundImage: NetworkImage(profile[0].profilePicture),
                ))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            profile[0].isGuide
                ? TextButton.icon(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Guide(
                                    id: profile[0].id,
                                  )));
                    },
                    icon: Icon(Icons.store),
                    label: Text(""),
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all(Colors.black)),
                  )
                : TextButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.store),
                    label: Text(""),
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all(Colors.grey)),
                  ),
            TextButton.icon(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Settings(
                              guide: profile[0].isGuide,
                              verified: profile[0].guideDetails!.isVerified,
                              id: profile[0].id,
                            )));
              },
              icon: Icon(Icons.settings),
              label: Text(""),
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.black)),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        ListTile(
          title: Text(profile[0].name,
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
          subtitle: Text(profile[0].description,
              style: TextStyle(fontFamily: "Poppins")),
        ),
        ListTile(
          title: Text("Address:",
              style: TextStyle(
                  fontFamily: "KulimPark",
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600)),
          subtitle:
              Text(profile[0].address, style: TextStyle(fontFamily: "Poppins")),
        ),
        ListTile(
          title: Text("Phone Number:",
              style: TextStyle(
                  fontFamily: "KulimPark",
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600)),
          subtitle:
              Text(profile[0].phone, style: TextStyle(fontFamily: "Poppins")),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
