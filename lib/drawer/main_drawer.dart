import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:women_safety_app/contact/contact.dart';
import 'package:women_safety_app/contact/contact_home.dart';
import 'package:women_safety_app/services/auth.dart';


class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Colors.purple,
            child: Center(
              child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,

                      /*image: DecorationImage(
                        image: AssetImage("images/ws1.png")
                      )*/
                    ),
                  )
                ],
              ),
            )
          ),
          ListTile(
            leading: Icon(Icons.star),
            title: Text(
              'Rate',
              style: TextStyle(
                fontSize: 15.0,
              ),
            ),
            onTap: () {
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text(
              'Settings',
              style: TextStyle(
                fontSize: 15.0,
              ),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => ContactHome()
              ));
            },
          ),
          ListTile(
            leading: Icon(Icons.contacts),
            title: Text(
              'Emergency Contact List',
              style: TextStyle(
                fontSize: 15.0,
              ),
            ),
            onTap: () {

              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => ShowContact()
              ));
            },
          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text(
              'Help',
              style: TextStyle(
                fontSize: 15.0,
              ),
            ),
            onTap: () {

              //launch("sms:123456789");

            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text(
              'Logout',
              style: TextStyle(
                fontSize: 15.0,
              ),
            ),
            onTap: () async {
              await _auth.signOut();
            },
          ),
        ],
      ),
    );
  }
}
