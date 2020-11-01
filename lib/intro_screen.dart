import 'package:flutter/material.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:women_safety_app/slider.dart';
import 'package:women_safety_app/wrapper.dart';
import 'package:intro_slider/intro_slider.dart';
class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  int _currentPage = 0;
  PageController _controller = PageController();

  List<Widget> _pages = [
    SliderPage(
      title: "Share Location",
      description: "Whenver You're in trouble share your location with your trusted contacts",
      image: "images/map_icon.png",

    ),
    SliderPage(
      title: "Emergency",
      description: "All your emergency numbers in one Place",
      image: "images/phone_icon.png",
    ),
    SliderPage(

      title: "Tips and Tricks",
      description: "Get Tips and tricks",
      image: "images/video_icon.png",
    ),

  ];

  _onChanged(int index){
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            scrollDirection: Axis.horizontal,
            controller: _controller,
            itemCount: _pages.length,
            onPageChanged: _onChanged,
            itemBuilder: (context, int index){
              return _pages[index];
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List<Widget>.generate(_pages.length, (int index) {
                    return AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        height: 10,
                        width: (index == _currentPage) ? 30 : 10,
                        margin:
                        EdgeInsets.symmetric(horizontal: 5, vertical: 30),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: (index == _currentPage)
                                ? Colors.red
                                : Colors.red.withOpacity(0.5)));
                  })),
              InkWell(
                onTap: () {
                  _controller.nextPage(
                      duration: Duration(milliseconds: 800),
                      curve: Curves.easeInOutQuint);
                },
                child: AnimatedContainer(
                  alignment: Alignment.center,
                  duration: Duration(milliseconds: 300),
                  height: 70,
                  width: (_currentPage == (_pages.length - 1)) ? 200 : 75,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(35)),
                  child: (_currentPage == (_pages.length - 1))
                      ? RaisedButton (
                    color: Colors.red,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),

                    ),

                    child: Text(
                      "Get Started",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontFamily: 'Segoe UI'

                      ),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>Wrapper()),
                      );
                    },
                  )
                      : Icon(
                    Icons.navigate_next,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              )
            ],
          ),
        ],
      ),
    );
  }
}