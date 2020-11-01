import 'package:flutter/material.dart';
import 'package:women_safety_app/contact/add_contact.dart';
import 'package:women_safety_app/contact/family_contact.dart';
import 'package:women_safety_app/contact/medical_contact.dart';

class ContactHome extends StatefulWidget {
  @override
  _ContactHomeState createState() => _ContactHomeState();
}

class _ContactHomeState extends State<ContactHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Emergency Contacts'),
      ),
     body: Center(
       child: Column(
         children: [
           RaisedButton(
             child: Text('Add Family Contact'),
             onPressed: () {
               Navigator.push(context, MaterialPageRoute(
                   builder: (context) => FamilyContact()
               ));
             },

           ),
           SizedBox(height: 20.0,),
           RaisedButton(
             child: Text('Add Police Contact'),
             onPressed: () {
               Navigator.push(context, MaterialPageRoute(
                   builder: (context) => PoliceContact()
               ));
             },

           ),
           SizedBox(height: 20.0,),
           RaisedButton(
             child: Text('Add Medical Emergency'),
             onPressed: () {
               Navigator.push(context, MaterialPageRoute(
                   builder: (context) => MedicalContact()
               ));
             },

           ),
         ],

       ),
     ),
    );
  }
}
