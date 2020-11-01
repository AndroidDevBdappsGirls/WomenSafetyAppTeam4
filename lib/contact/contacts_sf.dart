import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:women_safety_app/contact/contact_home.dart';
import 'contacts_sf.dart';
import 'package:get_it/get_it.dart';
import 'package:url_launcher/url_launcher.dart';

class callService{
  void call(String number)=>launch("tel:$number");
}
class Contacts extends StatefulWidget {
  @override
  _ContactsState createState() => _ContactsState();
}



class _ContactsState extends State<Contacts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF010115),
        title: Text(
          'Emergency Contacts',
          style: TextStyle(fontFamily: 'Segoe UI'),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/bg2.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Text(
              'Family and Others',
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: "Segoe UI"),
            ),
            SizedBox(
              height: 10.0,
            ),
            Column(
              children: [
                StreamBuilder(
                  stream: Firestore.instance
                      .collection("FamilyContact")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data.documents.length,
                          itemBuilder: (context, index) {
                            DocumentSnapshot documentSnapshot =
                            snapshot.data.documents[index];
                            return Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Text(
                                      documentSnapshot["contactName"] ??
                                          "",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Segoe UI'),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      documentSnapshot[
                                      "contactNumber"] ??
                                          "",
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontFamily: 'Segoe UI'),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      documentSnapshot["type"] ?? "",
                                      style: TextStyle(
                                          color: Color(0xFF303B90),
                                          fontFamily: 'Segoe UI'),
                                    ),
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      width:20,
                                      child: RaisedButton(
                                        color: Color(0xFFE22C3C),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(
                                              10.0),
                                          side: BorderSide(
                                              color: Colors.red),
                                        ),
                                        child: Text(
                                          ' Call',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Segoe UI',
                                              fontSize: 15.0),
                                        ),
                                        onPressed: () {
                                          Navigator.push(context,
                                            MaterialPageRoute(builder: (context)=>ContactHome()),
                                          );
                                        },),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          });
                    } else {
                      return Align(
                        alignment: FractionalOffset.bottomCenter,
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ],
            ),
            SizedBox(
              height: 30.0,
            ),
            Text(
              'Police Contact',
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: "Segoe UI"),
            ),
            SizedBox(
              height: 30.0,
            ),
            StreamBuilder(
              stream: Firestore.instance
                  .collection("PoliceContact")
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot documentSnapshot =
                        snapshot.data.documents[index];
                        return Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  documentSnapshot["contactName"],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Segoe UI'),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  documentSnapshot["contactNumber"],
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontFamily: 'Segoe UI'),
                                ),
                              ),
                              Expanded(
                                child: SizedBox(
                                  width: 10.0,
                                  child: RaisedButton(
                                    color: Color(0xFFE22C3C),
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(10.0),
                                      side:
                                      BorderSide(color: Colors.red),
                                    ),
                                    child: Text(
                                      ' Call',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Segoe UI',
                                          fontSize: 15.0),
                                    ),
                                    onPressed: () {
                                      Navigator.push(context,
                                        MaterialPageRoute(builder: (context)=>ContactHome()),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      });
                } else {
                  return Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            Text(
              'Medical Emergency',
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: "Segoe UI"),
            ),
            SizedBox(
              height: 10.0,
            ),
            StreamBuilder(
              stream: Firestore.instance
                  .collection("MedicalContact")
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot documentSnapshot =
                        snapshot.data.documents[index];
                        return Padding(
                          padding: const EdgeInsets.only(
                              top: 20.0, left: 10),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  documentSnapshot["contactName"],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Segoe UI'),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  documentSnapshot["contactNumber"],
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontFamily: 'Segoe UI'),
                                ),
                              ),
                              Expanded(
                                child: SizedBox(
                                  width: 20,
                                  child: RaisedButton(
                                    color: Color(0xFFE22C3C),
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(10.0),
                                      side:
                                      BorderSide(color: Colors.red),
                                    ),
                                    child: Text(
                                      ' Call',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Segoe UI',
                                          fontSize: 15.0),
                                    ),
                                    onPressed: () {
                                      const url = 'tel:999';

                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      });
                } else {
                  return Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ],
        ),

      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) {
              return ContactHome();
            }),
          );
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
  launchURL3() async {
    const url = 'tel:999';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
