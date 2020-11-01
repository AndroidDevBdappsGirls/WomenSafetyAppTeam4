import 'package:flutter/material.dart';
import 'package:women_safety_app/authentication/sign_in.dart';
import 'package:women_safety_app/services/auth.dart';
import 'package:women_safety_app/shared/constants.dart';
import 'package:women_safety_app/shared/loading.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});



  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.purple,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        elevation: 0.0,
        title: Text('Sign up to WS'),
        actions: [
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Sign in'),
            onPressed: () {
              widget.toggleView();

            },
          )
        ],

      ),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 20.0,),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Email'),
                  validator: (val) => val.isEmpty ? 'Enter an email' : null,
                  onChanged: (val) {
                    setState(() {
                      email = val;
                    });
                  },
                ),
                SizedBox(height: 20.0,),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Password'),
                  obscureText: true,
                  validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
                  onChanged: (val) {
                    setState(() {
                      password = val;
                    });

                  },
                ),
                SizedBox(height: 20.0,),
                RaisedButton(
                  color: Colors.pink[400],
                  child: Text(
                    'Register',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    setState(() {
                      loading = true;
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => SignIn()
                      ));

                    });

                    dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                    if(result == null) {
                      setState(() {
                        error = 'Provide valid email address';
                        loading = false;
                      });
                    }
                  }
                  },
                ),
                SizedBox(height: 12.0,),
                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 14.0),
                ),
              ],
            ),
          )
      ),
    );
  }
}
