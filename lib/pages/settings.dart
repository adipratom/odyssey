// ignore_for_file: prefer_const_constructors, must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:odyssey/main.dart';
import 'package:odyssey/pages/about.dart';
import 'package:odyssey/pages/edit_profile.dart';
import 'package:odyssey/pages/sign_in.dart';

import 'guide.dart';

class Settings extends StatefulWidget {
  late bool guide;
  late bool verified;
  late String id;
  Settings({required this.guide, required this.verified, required this.id});
  // const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool isSwitched = false;
  bool isEnableTile = false;
  @override
  Widget build(BuildContext context) {
    const appTitle = 'Settings';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                  onPressed: () {
                    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("ASDASD")));
                    // Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Main(
                                  id: widget.id,
                                  indexPage: 3,
                                )));
                  },
                  icon: Icon(Icons.chevron_left));
            },
          ),
          title: const Text(appTitle,
              style: TextStyle(fontFamily: 'Poppins', fontSize: 20)),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListTile(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EditProfile(id: widget.id)));
              },
              title: Text("Edit Profile",
                  style: TextStyle(fontFamily: 'Poppins', fontSize: 14)),
            ),
            widget.guide
                ? SwitchListTile(
                    activeColor: Color.fromARGB(255, 204, 164, 137),
                    value: isSwitched,
                    title: Text("Guide",
                        style: TextStyle(fontFamily: 'Poppins', fontSize: 14)),
                    onChanged: (value) {
                      setState(() {
                        isSwitched = value;
                        isEnableTile = value;
                      });
                    },
                  )
                : SizedBox(),
            widget.guide
                ? ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Guide(id: widget.id)));
                    },
                    enabled: isEnableTile,
                    title: Text("Open Guide Profile",
                        style: TextStyle(fontFamily: 'Poppins', fontSize: 14)),
                  )
                : SizedBox(),
            widget.guide
                ? ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Main(
                                    id: widget.id,
                                    indexPage: 0,
                                  )));
                    },
                    enabled: isEnableTile,
                    title: Text("Verified Status: ${widget.verified}",
                        style: TextStyle(fontFamily: 'Poppins', fontSize: 14)),
                  )
                : SizedBox(),
            // widget.guide
            //     ? ListTile(
            //         onTap: () {
            //           Navigator.push(context,
            //               MaterialPageRoute(builder: (context) => EditGuide()));
            //         },
            //         enabled: isEnableTile,
            //         title: Text("Edit Guide Profile",
            //             style: TextStyle(fontFamily: 'Poppins', fontSize: 14)),
            //       )
            //     : SizedBox(),
            Divider(
              color: Colors.black,
            ),
            ListTile(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => SignInScreen()));
              },
              title: Text("Logout",
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      color: Color.fromARGB(255, 204, 164, 137))),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => About()));
              },
              title: Text("About Us",
                  style: TextStyle(fontFamily: 'Poppins', fontSize: 14)),
            ),
          ],
        ),
        // body: SettingsList(
        // backgroundColor: Colors.white,

        // sections: [
        //   SettingsSection(
        //     titlePadding: EdgeInsets.all(20),
        //     tiles: [
        //       SettingsTile(
        //         title: 'Edit Profile',
        //         onPressed: (BuildContext context) {},
        //       ),
        //       SettingsTile.switchTile(
        //         title: 'Guide Mode',
        //         switchValue: isSwitched,
        //         onToggle: (value) {
        //           setState(() {
        //             isSwitched = value;
        //           });
        //         },
        //       ),
        //       SettingsTile(
        //         title: 'Open Guide Profile',
        //         onPressed: (BuildContext context) {},
        //       ),
        //       SettingsTile(
        //         title: 'Verified Status',
        //         onPressed: (BuildContext context) {},
        //       ),
        //       SettingsTile(
        //         title: 'Edit Guide Profile',
        //         onPressed: (BuildContext context) {},
        //       ),
        //     ],
        //   ),
        //   SettingsSection(
        //     titlePadding: EdgeInsets.all(20),
        //     tiles: [
        //       SettingsTile(
        //         title: 'Logout',
        //         onPressed: (BuildContext context) {},
        //       ),
        //       SettingsTile(
        //         title: 'About',
        //         onPressed: (BuildContext context) {},
        //       ),
        //     ],
        //   ),
        // ],
      ),
    );
  }
}
