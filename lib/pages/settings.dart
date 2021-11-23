import 'package:flutter/material.dart';
import 'package:odyssey/main.dart';
import 'package:odyssey/pages/profile.dart';
import 'package:settings_ui/settings_ui.dart';

class Settings extends StatefulWidget {
  const Settings({ Key? key }) : super(key: key);

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
        backgroundColor:Colors.white ,
        appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(onPressed: () {
                // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("ASDASD")));
                Navigator.push(context, MaterialPageRoute(builder: (context) => Main()));
              }, icon: Icon(Icons.chevron_left));
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
              onTap: (){

              },
              title: Text("Edit Profile", 
               style: TextStyle(fontFamily: 'Poppins', fontSize: 14)),
            ),
            SwitchListTile(
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
            ),
            ListTile(
              onTap: () {

              },
              enabled: isEnableTile,
              title: Text("Open Guide Profile", 
               style: TextStyle(fontFamily: 'Poppins', fontSize: 14)),
            ),
            ListTile(
              onTap: (){

              },
              enabled: isEnableTile,
              title: Text("Verified Status", 
               style: TextStyle(fontFamily: 'Poppins', fontSize: 14)),
            ),
            ListTile(
              onTap: (){

              },
              enabled: isEnableTile,
              title: Text("Edit Guide Profile", 
               style: TextStyle(fontFamily: 'Poppins', fontSize: 14)),
            ),
            Divider(color: Colors.black,),
            ListTile(
              onTap: (){

              },
              title: Text("Logout", 
               style: TextStyle(fontFamily: 'Poppins', fontSize: 14, color: Color.fromARGB(255, 204, 164, 137))),
            ),
            ListTile(
              onTap: (){

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