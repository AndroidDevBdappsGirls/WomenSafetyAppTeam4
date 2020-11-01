import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SosPage extends StatefulWidget {
  @override
  _SosPageState createState() => _SosPageState();
}

class _SosPageState extends State<SosPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                onPressed: _launchURL,
                child: Text('Emergency Contact Help'),
              ),
              RaisedButton(
                onPressed: _launchURL1,
                child: Text('Police Help'),
              ),
            ]
        ),
      ),
    );
  }
  _launchURL() async {
    const url = 'sms:+88018974628697?body=Help please!, I am in trouble, My location: https://www.google.com/maps/place/Maniknagar';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchURL1() async {
    const url2 = 'sms:5550101234?body=Help! I am in trouble, My location: https://www.google.com/maps/place/Maniknagar';
    if (await canLaunch(url2)) {
      await launch(url2);
    } else {
      throw 'Could not launch $url2';
    }
  }

}
