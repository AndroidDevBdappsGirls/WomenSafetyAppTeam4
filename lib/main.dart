import 'package:flutter/material.dart';
import 'package:women_safety_app/intro_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:women_safety_app/services/auth.dart';
import 'package:women_safety_app/models/user.dart';



void main()  {
  runApp(MyApp());
}

  //WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(

      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Women Safety App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: IntroScreen(),
      ),
    );
  }
}


  
