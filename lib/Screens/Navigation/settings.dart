import 'package:assyst/Authentication/authentication.dart';
import 'package:assyst/Database/UserDB/newuserdb.dart';
import 'package:assyst/Terms/terms.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  QuerySnapshot users;

  UserRegister userData = new UserRegister();

  int index;

  @override
  final Uri emailLaunch = Uri(
      scheme: 'mailto',
      path: 'assyst11@gmail.com',
      queryParameters: {'subject': 'Issues or bug about your app'});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(color: Colors.black),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white12,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 50),
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              Divider(),
              ListTile(
                leading: Icon(Icons.warning),
                title: Text(
                  'Terms of use and privacy policy',
                  style: TextStyle(color: Colors.black),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Terms()));
                },
              ),
              ListTile(
                leading: Icon(Icons.contact_mail),
                title: Text(
                  'Contact support or report bug',
                  style: TextStyle(color: Colors.black),
                ),
                onTap: () {
                  launch(emailLaunch.toString());
                },
              ),
              Divider(),
              SizedBox(height: 20),
              Divider(),
              ListTile(
                leading: Icon(Icons.star),
                title: Text(
                  'Rate us',
                  style: TextStyle(color: Colors.black),
                ),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.info),
                title: Text(
                  'About us',
                  style: TextStyle(color: Colors.black),
                ),
                onTap: () {
                  return showDialog<void>(
                    context: context,
                    barrierDismissible: true,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(
                          'About us',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: <Widget>[
                              Text(
                                  "Assyst Inc. is a private software development company founded in 2020. Currently it operates in Addis Ababa but in the near future it is planning to expand to its business to more areas. For more information subscribe to our channel on Telegram and our Facebook page.           ")
                            ],
                          ),
                        ),
                        actions: [
                          FlatButton(
                            child: Text('Ok'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              Divider(),
              SizedBox(height: 20),
              Divider(),
              ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text(
                  'Logout',
                  style: TextStyle(color: Colors.black),
                ),
                onTap: () {
                  return showDialog<void>(
                    context: context,
                    barrierDismissible: true,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(
                          'Logout',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: <Widget>[
                              Text('Are you sure you want to logout?')
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          FlatButton(
                            child: Text('No'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          FlatButton(
                            child: Text('Yes'),
                            onPressed: () async {
                              AuthPhone().signOut();

                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              Divider(),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.copyright,
                    color: Colors.grey,
                  ),
                  SizedBox(width: 5),
                  Text(
                    'Assyst',
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
