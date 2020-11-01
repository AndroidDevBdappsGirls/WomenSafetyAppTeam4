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
class Contactstest extends StatefulWidget {
  @override
  _ContactsState createState() => _ContactsState();
}



class _ContactsState extends State<Contacts> {
  Query _ref;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _ref = FirebaseDatabase.instance
        .reference()
        .child('Contacts')
        .orderByChild('name');
  }

  Widget _buildContactItem({Map contact}) {
    Color typeColor = getTypeColor(contact['type']);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(10),
      height: 100,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.person,
                color: Colors.red,
                size: 20,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                contact['name'],
                style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Icon(
                Icons.phone_iphone,
                color: Theme.of(context).accentColor,
                size: 20,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                contact['number'],
                style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).accentColor,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(width: 15),
              Icon(
                Icons.group_work,
                color: typeColor,
                size: 20,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                contact['type'],
                style: TextStyle(
                    fontSize: 16,
                    color: typeColor,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF010115),
        title: Text('My Contacts'),
      ),

    body: Container(
    //backgroundColor: Colors.red,


    decoration: BoxDecoration(
    image: DecorationImage(
    image: AssetImage("images/bg2.png"),
    fit: BoxFit.cover,
    ),
    ),
        height: double.infinity,
        child: FirebaseAnimatedList(

          query: _ref,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            Map contact = snapshot.value;

            return _buildContactItem(contact: contact);
          },
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

  Color getTypeColor(String type) {
    Color color = Theme.of(context).accentColor;

    if (type == 'Work') {
      color = Color(0xFF303B90);
    }

    if (type == 'Family') {
      color = Color(0xFF303B90);
    }

    if (type == 'Friends') {
      color = Color(0xFF303B90);
    }
    return color;
  }
}

