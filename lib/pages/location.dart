import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class MyHomePage1 extends StatefulWidget {
  MyHomePage1({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePage1State createState() => _MyHomePage1State();
}

class _MyHomePage1State extends State<MyHomePage1> {

  GoogleMapController _controller;

  final CameraPosition _initialPosition = CameraPosition(target: LatLng(23.810331, 90.412521));

  final List<Marker> markers = [];

  addMarker(cordinate){

    int id = Random().nextInt(100);

    setState(() {
      markers.add(Marker(position: cordinate, markerId: MarkerId(id.toString())));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: _initialPosition,
        mapType: MapType.normal,
        onMapCreated: (controller){
          setState(() {
            _controller = controller;
          });
        },
        markers: markers.toSet(),
        onTap: (cordinate){
          _controller.animateCamera(CameraUpdate.newLatLng(cordinate));
          addMarker(cordinate);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _controller.animateCamera(CameraUpdate.zoomOut());
        },
        child: Icon(Icons.zoom_out),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}