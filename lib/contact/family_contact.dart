import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FamilyContact extends StatefulWidget {
  @override
  _FamilyContactState createState() => _FamilyContactState();
}

class _FamilyContactState extends State<FamilyContact> {


  String contactName,  contactNumber;
  String _typeSelected = "";


  getContactName(name){
    this.contactName = name;
  }

  getContactNumber(number) {
    this.contactNumber = number;
  }

 Widget _buildContactType(String title){

    return InkWell(

      child: Container(
        height: 40,
        width: 90,

        decoration: BoxDecoration(
          color: _typeSelected == title? Colors.green : Theme.of(context).accentColor,
          borderRadius: BorderRadius.circular(15),
        ),

        child: Center(child: Text(title, style: TextStyle(fontSize: 18,
            color: Colors.white),
        ),),),

      onTap: (){
        setState(() {
          _typeSelected = title;
        });
      },
    );
  }


  createData() {
    DocumentReference documentReference = Firestore.instance.collection("FamilyContact").
    document(contactName);

    Map<String, dynamic> contact = {
      "contactName": contactName,
      "contactNumber": '+88' + contactNumber,
      "type": _typeSelected

    };
    documentReference.setData(contact).whenComplete(() => print("$contact saved"));
  }

  readData() {
    DocumentReference documentReference = Firestore.instance.collection("FamilyContact").document(contactName);

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
        title: Text('Emergency Contact'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [

            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "Name",
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

          SizedBox(height: 15,),
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
