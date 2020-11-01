import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


class SelfDefenseVideo extends StatefulWidget {
  @override
  _SelfDefenseVideoState createState() => _SelfDefenseVideoState();
}

class _SelfDefenseVideoState extends State<SelfDefenseVideo> {
  String videoURL = "https://www.youtube.com/watch?v=T7aNSRoDCmg";

  YoutubePlayerController _controller;

  @override
  void initState() {
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(videoURL)
    );
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [

            YoutubePlayer(
              controller: _controller,
            )

          ],
        ),
      ),
    );
  }
}
