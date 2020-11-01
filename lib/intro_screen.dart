import 'package:flutter/material.dart';
import 'package:women_safety_app/slider.dart';
import 'package:women_safety_app/wrapper.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  int _currentPage = 0;
  PageController _controller = PageController();

  List<Widget> _pages = [
    SliderPage(
      title: "some title",
      description: "add some description",
      image: "images/ws1.png",

    ),
    SliderPage(
      title: "title",
      description: "add some description",
      image: "images/ws1.png",
    ),
    SliderPage(

      title: "title",
      description: "add some description",
      image: "images/ws1.png",
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
                        duration: Duration(milliseconds: 10),
                        height: 10,
                        width: (index == _currentPage) ? 30 : 10,
                        margin:
                        EdgeInsets.symmetric(horizontal: 5, vertical: 30),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: (index == _currentPage)
                                ? Colors.deepPurple
                                : Colors.deepPurple.withOpacity(0.5)));
                  })),
              InkWell(
                onTap: () {
                  _controller.nextPage(
                      duration: Duration(milliseconds: 100),
                      curve: Curves.easeInOutQuint);
                },
                child: AnimatedContainer(
                  alignment: Alignment.center,
                  duration: Duration(milliseconds: 10),
                  height: 70,
                  width: (_currentPage == (_pages.length - 1)) ? 200 : 75,
                  decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(35)),
                  child: (_currentPage == (_pages.length - 1))
                      ? RaisedButton (
                    color: Colors.deepPurple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.deepPurple)
                      ),

                      child: Text(
                        "Get Started",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,

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
