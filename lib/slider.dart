import 'package:flutter/material.dart';

class SliderPage extends StatelessWidget {
  final String title;
  final String description;
  final String image;


  double _height;
  double _width;

  SliderPage({this.title, this.description, this.image});

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;

    return Container(

      decoration: BoxDecoration(
        image: DecorationImage(

          image: AssetImage("images/bg.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Image.asset(image,scale: 3.00),
          SizedBox(
            height: 10.0,
          ),
          Text(
            title,
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold,fontFamily: 'Segoe UI',color: Colors.white),
          ),
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80.0),
            child: Text(
              description,
              style: TextStyle(
                  height: 1.5,
                  fontSize: 14.0,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Segoe UI',
                  color: Colors.red,
                  letterSpacing: 0.7),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 60.0,
          )
        ],
      ),
    );
  }
}
