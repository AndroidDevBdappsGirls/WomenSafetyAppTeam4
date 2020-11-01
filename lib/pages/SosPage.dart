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
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/bg.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 200,
                child: Image.asset("images/logo.png"),
              ),
              SizedBox(height: 50.0),
              SizedBox(
                height: 55, // specific value

                child: RaisedButton(
                    color: Colors.red[400],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                      side: BorderSide(color: Color(0xFFE22C3C)),
                    ),
                    child: Text(
                      'Emergency Contact Help',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Segoe UI',
                          fontSize: 15.0),
                    ),
                    onPressed: _launchURL,),
              ),
              SizedBox(height: 12.0),
              SizedBox(
                height: 55, // specific value

                child: RaisedButton(
                  color: Colors.red[400],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0),
                    side: BorderSide(color: Color(0xFFE22C3C)),
                  ),
                  child: Text(
                    'Police Help',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Segoe UI',
                        fontSize: 15.0),
                  ),
                  onPressed: _launchURL1,),
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