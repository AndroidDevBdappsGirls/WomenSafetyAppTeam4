import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';



void main() => runApp(Tips());

class Tips extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: HomePage(),
    );

  }
}

class HomePage extends StatefulWidget {
  //HomePage({Key key}):(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String url="https://youtu.be/BUV_ql4gZxc";
  String url2="https://www.youtube.com/watch?v=eVexWKzFHzM";

  YoutubePlayerController _controller;
  YoutubePlayerController _controller2;
  @override
  void initState() {
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(url)
    );
    _controller2 = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(url2)
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(

            image: AssetImage("images/bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              YoutubePlayer(
                controller: _controller,
              ),
              SizedBox(   //Use of SizedBox
                height: 70,
              ),
              Center(child:Container(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: Text('Women safety',
                    style: TextStyle(fontSize: 25.0, color: Colors.red,fontFamily: 'Segoe UI'),
                    textAlign: TextAlign.left,
                  )
              )
              ),

              Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: Text('Women is the one who never take care of her health and always think about her families and about her children, When a women get up in morning first he think that what he cook for their family and for their children. If womens is doing that too much for us, so this is our responsiblities to save womens. Womes safety is the best safety ever you will do, if you protect a womens life in your life,',
                    style: TextStyle(fontSize: 15.0, color: Colors.white,fontFamily: 'Segoe UI'),
                    textAlign: TextAlign.left,
                  )
              ),
              SizedBox(   //Use of SizedBox
                height: 70,
              ),
              YoutubePlayer(
                controller: _controller2,
              ),
              SizedBox(   //Use of SizedBox
                height: 70,
              ),
              Center(child:Container(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: Text('Women safety',
                    style: TextStyle(fontSize: 25.0, color: Colors.red,fontFamily: 'Segoe UI'),
                    textAlign: TextAlign.left,
                  )
              )
              ),

              Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: Text('Women is the one who never take care of her health and always think about her families and about her children, When a women get up in morning first he think that what he cook for their family and for their children. If womens is doing that too much for us, so this is our responsiblities to save womens. Womes safety is the best safety ever you will do, if you protect a womens life in your life,',
                    style: TextStyle(fontSize: 15.0, color: Colors.white,fontFamily: 'Segoe UI'),
                    textAlign: TextAlign.left,
                  )
              ),
              SizedBox(   //Use of SizedBox
                height: 70,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


