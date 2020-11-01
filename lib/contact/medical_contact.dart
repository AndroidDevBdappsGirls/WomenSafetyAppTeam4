import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:women_safety_app/contact/contact.dart';

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
        backgroundColor: Color(0xFF010115),
        title: Text('Medical Helpline',style: TextStyle(fontFamily: 'Segoe UI'),),
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
                    labelText: "Hospital Name",
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








