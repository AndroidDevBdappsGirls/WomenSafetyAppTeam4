import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:women_safety_app/contact/contact_home.dart';
import 'package:women_safety_app/contact/contacts.dart';
import 'package:women_safety_app/drawer/main_drawer.dart';
import 'package:women_safety_app/pages/location.dart';
import 'helper.dart';
import 'package:flutter/material.dart';
import 'package:women_safety_app/contact/contacts_sf.dart';
import 'package:women_safety_app/pages/SosPage.dart';
import 'package:women_safety_app/pages/current_location.dart';
import 'package:women_safety_app/pages/tips.dart';
import 'package:women_safety_app/services/auth.dart';

class newHome extends StatefulWidget {
  @override
  _newHomeState createState() => _newHomeState();
}

class _newHomeState extends State<newHome> {
  var _currentIndex = 0;
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text('SHEield'),
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
                builder: (context) => MainDrawer()
            ));
          },
          child: Icon(
            Icons.menu,
            size: 20,
          ),
        ),
      ),
      //resizeToAvoidBottomPadding: false,
      body: Container(
        //backgroundColor: Colors.red,


        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/bg2.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
            children: <Widget>[
              SizedBox(   //Use of SizedBox
                height: 50,
              ),
              Container(
                height: 200,
                child: Image.asset("images/logo.png"),
              ),
              Expanded(
                child: Row(
                  children: [
                    new Padding(
                      padding: const EdgeInsets.all(18.0),

                    ),
                    SizedBox(height: 50.0),
                    MaterialButton(

                      textColor: Colors.white,
                      splashColor: Colors.white.withOpacity(0.2),
                      elevation: 8.0,
                      child: Container(
                        height: 130,
                        width: 130,

                        decoration: BoxDecoration(
                          //boxShadow: true,
                          image: DecorationImage(
                              image: AssetImage('images/helpline.png'),
                              fit: BoxFit.cover),
                        ),

                      ),
                      // ),
                      onPressed: () {
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context)=>ContactHome()),
                        );
                      },
                    ),

                    MaterialButton(

                      textColor: Colors.white,
                      splashColor: Colors.white.withOpacity(0.2),
                      elevation: 8.0,
                      child: Container(
                        height: 130,
                        width: 130,

                        decoration: BoxDecoration(
                          //boxShadow: true,
                          image: DecorationImage(
                              image: AssetImage('images/contacts.png'),
                              fit: BoxFit.cover),
                        ),

                      ),
                      // ),
                      onPressed: () {
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context)=>ContactHome()),
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 19.0),
              Expanded(
                child: Row(
                  children: [
                    new Padding(
                      padding: const EdgeInsets.all(18.0),

                    ),
                    SizedBox(height: 50.0),
                    MaterialButton(

                      textColor: Colors.white,
                      splashColor: Colors.white.withOpacity(0.2),
                      elevation: 8.0,
                      child: Container(
                        height: 130,
                        width: 130,

                        decoration: BoxDecoration(
                          //boxShadow: true,
                          image: DecorationImage(
                              image: AssetImage('images/tips.png'),
                              fit: BoxFit.cover),
                        ),

                      ),
                      // ),
                      onPressed: () {
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context)=>Tips()),
                        );
                      },
                    ),

                    MaterialButton(

                      textColor: Colors.white,
                      splashColor: Colors.white.withOpacity(0.2),
                      elevation: 8.0,
                      child: Container(
                        height: 130,
                        width: 130,

                        decoration: BoxDecoration(
                          //boxShadow: true,
                          image: DecorationImage(
                              image: AssetImage('images/map.png'),
                              fit: BoxFit.cover),
                        ),

                      ),
                      // ),
                      onPressed: () {
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context)=>MyHomePage1()),
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15.0),
              MaterialButton(
                color: Color(0xFFE22C3C),
                shape: CircleBorder(),
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.all(50),
                  child: Text(
                    'SOS',
                    style: TextStyle(color: Colors.white, fontSize: 20,fontFamily: 'Segoe UI',fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(   //Use of SizedBox
                height: 50,
              ),


    ]
      ),
      ),
    );
  }
}
