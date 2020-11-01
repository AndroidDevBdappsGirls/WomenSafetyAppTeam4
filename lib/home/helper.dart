import 'package:flutter/material.dart';
import 'helper.dart';

class RoundedButton extends StatelessWidget {

  RoundedButton({this.title,this.colour,this.onPressed});

  final Color colour;
  final String title;
  final Function onPressed;


  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.0),
      child: Material(
        color:colour ,
        borderRadius: BorderRadius.circular(5.0),

        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 130.0,
          height: 130.0,


          child: Text(
            title,
            style: TextStyle(fontSize: 17.0,color:Colors.red,fontFamily: 'Segoe UI'),
          ),

        ),

      ),
    );
  }
}


const textFieldDecoration = InputDecoration(
    filled: true,
    fillColor: Colors.white,
    hintText: "Enter your user name",
    hintStyle: TextStyle(fontSize: 15.0, color: Colors.white,fontFamily: 'Segoe UI'),
    contentPadding: EdgeInsets.symmetric(vertical: 10.0,horizontal:20.0),
    border:OutlineInputBorder(),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
      // borderSide: BorderSide(color: Colors.red,width: 1.0)
    ),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(32.0)),
        borderSide: BorderSide(color: Colors.redAccent,width: 1.0)
    )
);