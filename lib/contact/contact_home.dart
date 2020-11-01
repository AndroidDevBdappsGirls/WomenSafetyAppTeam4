import 'package:flutter/material.dart';
import 'package:women_safety_app/contact/police_contact.dart';
import 'package:women_safety_app/contact/family_contact.dart';
import 'package:women_safety_app/contact/medical_contact.dart';
import 'package:women_safety_app/contact/police_contact.dart';

class ContactHome extends StatefulWidget {
  @override
  _ContactHomeState createState() => _ContactHomeState();
}

class _ContactHomeState extends State<ContactHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        //backgroundColor: Colors.red,

        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(

          child: Column(

            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 50.0),
              Container(
                height: 200,
                child: Image.asset("images/logo.png"),
              ),
              SizedBox(height: 50.0),
              SizedBox(
                height: 55, // specific value

                child: RaisedButton(
                    color: Colors.red[400],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                      side: BorderSide(color: Color(0xFFE22C3C)),
                    ),
                    child: Text(
                      'Add Family Contacts',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Segoe UI',
                          fontSize: 15.0),
                    ),
                    onPressed: () async {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => FamilyContact()));
                    }),
              ),
              SizedBox(
                height: 20.0,
              ),
              SizedBox(
                height: 55, // specific value

                child: RaisedButton(
                    color: Colors.red[400],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                      side: BorderSide(color: Color(0xFFE22C3C)),
                    ),
                    child: Text(
                      'Add Police Contact',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Segoe UI',
                          fontSize: 15.0),
                    ),
                    onPressed: () async {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => PoliceContact()));
                    }),
              ),
              SizedBox(
                height: 20.0,
              ),

              SizedBox(
                height: 55, // specific value

                child: RaisedButton(
                    color: Colors.red[400],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                      side: BorderSide(color: Color(0xFFE22C3C)),
                    ),
                    child: Text(
                      'Add Medical Emergency',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Segoe UI',
                          fontSize: 15.0),
                    ),
                    onPressed: () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MedicalContact()));
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
