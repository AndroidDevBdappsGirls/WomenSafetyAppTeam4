import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:women_safety_app/contact/contact.dart';
import 'package:women_safety_app/contact/contact_home.dart';
import 'package:women_safety_app/contact/contacts.dart';
import 'package:women_safety_app/contact/contacts_sf.dart';
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
      elevation: 5,
      child: Container(
        width: 200,
        height: 100,
        decoration: BoxDecoration(
          image: new DecorationImage(
            image: AssetImage("images/dashboard_bg2.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Container(

                width: double.infinity,
                padding: EdgeInsets.all(20),
                color: Color(0xFF010115),
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
                )),
            ListTile(
              leading: Icon(Icons.star,color: Color(0xFF010115),),
              title: Text(
                'Rate',
                style: TextStyle(
                  fontSize: 15.0,
                  color: Color(0xFF010115),
                  fontFamily: 'Segoe UI',
                    fontWeight: FontWeight.bold
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.settings,color: Color(0xFF010115),),
              title: Text(
                'Settings',
                style: TextStyle(
                  fontSize: 15.0,
                    color: Color(0xFF010115),
                    fontFamily: 'Segoe UI',
                  fontWeight: FontWeight.bold
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ContactHome()));
              },
            ),
            ListTile(
              leading: Icon(Icons.help,color: Color(0xFF010115),),
              title: Text(
                'Help',
                style: TextStyle(
                  fontSize: 15.0,
                    color: Color(0xFF010115),
                    fontFamily: 'Segoe UI',
                    fontWeight: FontWeight.bold
                ),
              ),
              onTap: () {
                //launch("sms:123456789");
              },
            ),
            ListTile(
              leading: Icon(Icons.person,color: Color(0xFF010115),),
              title: Text(
                'Logout',
                style: TextStyle(
                  fontSize: 15.0,
                    color: Color(0xFF010115),
                    fontFamily: 'Segoe UI',
                    fontWeight: FontWeight.bold
                ),
              ),
              onTap: () async {
                await _auth.signOut();
              },
            ),
          ],
        ),
      ),
    );
  }
}
