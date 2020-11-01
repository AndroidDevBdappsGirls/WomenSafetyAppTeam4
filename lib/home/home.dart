import 'package:flutter/material.dart';
import 'package:women_safety_app/contact/contact.dart';
//import 'package:women_safety_app/contact/add_contact.dart';
import 'package:women_safety_app/contact/contact_home.dart';
import 'package:women_safety_app/contact/contacts.dart';
import 'package:women_safety_app/drawer/main_drawer.dart';
import 'package:women_safety_app/pages/SosPage.dart';
import 'package:women_safety_app/pages/current_location.dart';
import 'package:women_safety_app/pages/tips.dart';
import 'package:women_safety_app/services/auth.dart';


class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _currentIndex = 0;
  final AuthService _auth = AuthService();

  final pages = [
    CurrentLocation(),
    SosPage(),
    ShowContact(),
    Tips()


  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        backgroundColor: Colors.black54,
        /*floatingActionButton:
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Logout'),
            onPressed: () async {
              await _auth.signOut();
            },
          ),*/


        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,

          title: Text('SHEield',
              style: TextStyle(color: Colors.white,fontFamily: 'Segoe UI'),
          ),

          backgroundColor: Color(0xFF010115),
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('Logout'),
              onPressed: () async {
                await _auth.signOut();
              },
            ),


          ],
          leading: GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => MainDrawer(),
              ));
            },
            child: Icon(
              Icons.menu,
              size: 20,
            ),
          ),
        ),

        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              backgroundColor: Color(0xFF010115),
              icon: Icon(Icons.place),
              title: Text(''),

            ),
            BottomNavigationBarItem(
              backgroundColor: Color(0xFF010115),
              icon: Icon(Icons.touch_app),
              title: Text('SOS'),
            ),
            BottomNavigationBarItem(
              backgroundColor: Color(0xFF010115),
              icon: Icon(Icons.person_add),
              title: Text('Add Contacts'),
            ),
            BottomNavigationBarItem(
              backgroundColor: Color(0xFF010115),
              icon: Icon(Icons.lightbulb_outline),
              title: Text('Tips'),
            ),
          ],
        ),
        body: pages[_currentIndex],
      ),
    );
  }
}