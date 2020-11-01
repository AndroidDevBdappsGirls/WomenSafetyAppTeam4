import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:women_safety_app/authentication/authenticate.dart';
import 'package:women_safety_app/home/home.dart';
import 'package:women_safety_app/models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);

    // return either Home or Authenticate widget
    if (user ==  null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
