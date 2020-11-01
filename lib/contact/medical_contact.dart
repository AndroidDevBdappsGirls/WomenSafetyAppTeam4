import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MedicalContact extends StatefulWidget {
  @override
  _MedicalContactState createState() => _MedicalContactState();
}

class _MedicalContactState extends State<MedicalContact> {

  String contactName,  contactNumber;


  getContactName(name){
    this.contactName = name;
  }

  getContactNumber(number) {
    this.contactNumber = number;
  }


  createData() {
    DocumentReference documentReference = Firestore.instance.collection("MedicalContact").
    document(contactName);

    Map<String, dynamic> contact = {
      "contactName": contactName,
      "contactNumber": "+88" + contactNumber,

    };
    documentReference.setData(contact).whenComplete(() => print("$contact saved"));
  }

  readData() {
    DocumentReference documentReference = Firestore.instance.collection("MedicalContact").document(contactName);

    documentReference.get().then((datasnapshot) {
      print(datasnapshot.data["contactName"]);
      print(datasnapshot.data["contactNumber"]);
    });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Medical Emergency'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [

            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "Hospital Name",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue,
                          width: 2.0),
                    )
                ),
                onChanged: (String name) {
                  getContactName(name);
                },
              ),
            ),

            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "Phone Number",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue,
                          width: 2.0),
                    )
                ),
                onChanged: (String number) {
                  getContactNumber(number);
                },
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  color: Colors.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  child: Text("Save"),
                  textColor: Colors.white,
                  onPressed: () {
                    createData();
                  },
                ),


              ],
            ),

          ],
        ),
      ),
    );
  }
}
