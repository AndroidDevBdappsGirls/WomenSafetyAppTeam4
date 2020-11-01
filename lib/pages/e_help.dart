import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EHelp extends StatefulWidget {

  @override
  _EHelpState createState() => _EHelpState();
}

class _EHelpState extends State<EHelp> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: _launchURL,
          child: Text('Show Flutter homepage'),
        ),
      ),
    );
  }

  _launchURL() async {
    const url = 'sms:5550101234?body=hello';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}