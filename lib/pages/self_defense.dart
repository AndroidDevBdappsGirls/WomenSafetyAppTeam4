import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:women_safety_app/pages/self_defense_video.dart';

class SelfDefense extends StatefulWidget {
  @override
  _SelfDefenseState createState() => _SelfDefenseState();
}

class _SelfDefenseState extends State<SelfDefense> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  padding: const EdgeInsets.all(8.0),
                  textColor: Colors.white,
                  color: Colors.deepOrange,
                  onPressed: (){

                  },
                  child: new Text("Techniques"),
                ),
                RaisedButton(
                  padding: const EdgeInsets.all(8.0),
                  textColor: Colors.white,
                  color: Colors.deepOrange,
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => SelfDefenseVideo()
                    ));
                  },
                  child: new Text("Video Tutorial"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
