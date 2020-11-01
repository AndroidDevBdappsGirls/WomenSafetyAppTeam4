import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class ShowContact extends StatefulWidget {
  @override
  _ShowContactState createState() => _ShowContactState();
}

class _ShowContactState extends State<ShowContact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: null,
        appBar: AppBar(
          title:
          Text('Emergency Contacts'),
        ),

        body: SingleChildScrollView(
          child: Column(
            children: [

              Column(
                children: [

                  Column(
                    children: [
                      Text(
                        'Family and Others',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      StreamBuilder(
                        stream: Firestore.instance.collection("FamilyContact")
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
                                                  ""),
                                        ),
                                        Expanded(
                                          child: Text(
                                              documentSnapshot["contactNumber"] ??
                                                  ""),
                                        ),
                                        Expanded(
                                          child: Text(
                                              documentSnapshot["type"] ?? ""),
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

                  SizedBox(height: 10.0,),
                  Text(
                    'Police Contact',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 10.0,),
                  StreamBuilder(
                    stream: Firestore.instance.collection("PoliceContact")
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
                                          documentSnapshot["contactName"]),
                                    ),
                                    Expanded(
                                      child: Text(
                                          documentSnapshot["contactNumber"]),
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
              SizedBox(height: 10.0,),

              Column(
                children: [
                  Text(
                    'Medical Emergency',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 10.0,),
                  StreamBuilder(
                    stream: Firestore.instance.collection("MedicalContact")
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
                                          documentSnapshot["contactName"]),
                                    ),
                                    Expanded(
                                      child: Text(
                                          documentSnapshot["contactNumber"]),
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
              RaisedButton(
                onPressed: _launchURL3,
                child: Text('Call Emergency'),
              ),
            ],

          ),
        )
    );
  }

  _launchURL3() async {
    const url = 'tel:999';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }


  }

