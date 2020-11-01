import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:women_safety_app/contact/contact.dart';
import 'package:women_safety_app/contact/contacts.dart';

class FamilyContact extends StatefulWidget {
  @override
  _FamilyContactState createState() => _FamilyContactState();
}

class _FamilyContactState extends State<FamilyContact> {
  String contactName, contactNumber;
  String _typeSelected = "";

  getContactName(name) {
    this.contactName = name;
  }

  getContactNumber(number) {
    this.contactNumber = number;
  }

  Widget _buildContactType(String title) {
    return InkWell(
      child: Container(
        height: 40,
        width: 90,
        decoration: BoxDecoration(
          color: _typeSelected == title
              ? Colors.red
              : Color(0xFF303B90),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                fontSize: 18, color: Colors.white, fontFamily: 'Segoe UI'),
          ),
        ),
      ),
      onTap: () {
        setState(() {
          _typeSelected = title;
        });
      },
    );
  }

  createData() {
    DocumentReference documentReference =
        Firestore.instance.collection("FamilyContact").document(contactName);

    Map<String, dynamic> contact = {
      "contactName": contactName,
      "contactNumber": '+88' + contactNumber,
      "type": _typeSelected
    };
    documentReference
        .setData(contact)
        .whenComplete(() => print("$contact saved"));
  }

  readData() {
    DocumentReference documentReference =
        Firestore.instance.collection("FamilyContact").document(contactName);

    documentReference.get().then((datasnapshot) {
      print(datasnapshot.data["contactName"]);
      print(datasnapshot.data["contactNumber"]);
      print(datasnapshot.data["type"]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF010115),
        title: Text('Save Contact',style: TextStyle(fontFamily: 'Segoe UI'),),
      ),
      body: Container(
    //padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
    decoration: BoxDecoration(
    image: DecorationImage(
    image: AssetImage("images/bg2.png"),
    fit: BoxFit.cover,
    ),
    ),
    child:Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 200,
                child: Image.asset("images/logo.png"),
              ),
              TextFormField(
                //controller: _nameController,
                decoration: InputDecoration(
                  fillColor: Colors.white.withOpacity(0.2),
                  labelText: "Name",
                  labelStyle: TextStyle(color: Colors.white, fontFamily: "Segoe UI"),
                  //hintText: 'Enter Name',
                  hintStyle:
                  TextStyle(color: Colors.white, fontFamily: "Segoe UI"),
                  prefixIcon: Icon(
                    Icons.account_circle,
                    size: 30,
                    color: Colors.white,
                  ),
                  border: OutlineInputBorder(
                    // width: 0.0 produces a thin "hairline" border
                      borderRadius: BorderRadius.all(Radius.circular(90.0)),
                      borderSide: BorderSide(color: Colors.red)
                    //borderSide: const BorderSide(),
                  ),
                  //fillColor: Colors.white,
                  filled: true,
                  contentPadding: EdgeInsets.all(15),
                ),
                onChanged: (String name) {
                  getContactName(name);
                },
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                //controller: _nameController,
                decoration: InputDecoration(
                  labelText: "Phone Number",
                  fillColor: Colors.white.withOpacity(0.2),
                  labelStyle: TextStyle(color: Colors.white, fontFamily: "Segoe UI"),
                  //hintText: 'Enter Name',
                  hintStyle:
                  TextStyle(color: Colors.white, fontFamily: "Segoe UI"),
                  prefixIcon: Icon(
                    Icons.phone_android,
                    size: 30,
                    color: Colors.white,
                  ),
                  border: OutlineInputBorder(
                    // width: 0.0 produces a thin "hairline" border
                      borderRadius: BorderRadius.all(Radius.circular(90.0)),
                      borderSide: BorderSide(color: Colors.red)
                    //borderSide: const BorderSide(),
                  ),
                  //fillColor: Colors.white,
                  filled: true,
                  contentPadding: EdgeInsets.all(15),
                ),
                onChanged: (String number) {
                  getContactNumber(number);
                },
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildContactType('Family'),
                    SizedBox(width: 10),
                    _buildContactType('Friends'),
                    SizedBox(width: 10),
                    _buildContactType('Work'),
                    SizedBox(width: 10),
                    _buildContactType('Others'),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: double.infinity,
                //padding: EdgeInsets.symmetric(horizontal: 10),
                child: SizedBox(
                  height: 45.0,
                  child: RaisedButton(

                      color: Color(0xFFE22C3C),


                      shape: RoundedRectangleBorder(

                        borderRadius: BorderRadius.circular(32.0),
                        side: BorderSide(color: Colors.red),

                      ),

                      child: Text(
                        'Save Contact',
                        style: TextStyle(color: Colors.white,fontFamily: 'Segoe UI',fontSize: 15.0),
                      ),
                    onPressed: () {
                      createData();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ShowContact()));
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 300,
              ),
            ],
          ),
        ),
      ),
      ),
    );
  }
}
