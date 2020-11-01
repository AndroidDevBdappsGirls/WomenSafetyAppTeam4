import 'package:flutter/material.dart';
import 'package:women_safety_app/authentication/register.dart';
import 'package:women_safety_app/services/auth.dart';
import 'package:women_safety_app/shared/constants.dart';
import 'package:women_safety_app/shared/loading.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;

  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String error = '';

  // text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            body: Container(
              //backgroundColor: Colors.red,

              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/bg.png"),
                  fit: BoxFit.cover,
                ),
              ),

              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        SizedBox(height: 50.0),
                        Container(
                          height: 200,
                          child: Image.asset("images/logo.png"),
                        ),
                        SizedBox(height: 50.0),
                        TextFormField(
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.white,
                              ),
                              border: OutlineInputBorder(
                                  // width: 0.0 produces a thin "hairline" border
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(90.0)),
                                  borderSide: BorderSide(color: Colors.white24)
                                  //borderSide: const BorderSide(),
                                  ),
                              hintStyle: TextStyle(
                                  color: Colors.white, fontFamily: "Segoe UI"),
                              filled: true,
                              fillColor: Colors.white24,
                              hintText: 'Email'),
                          validator: (val) =>
                              val.isEmpty ? 'Enter an email' : null,
                          onChanged: (val) {
                            setState(() => email = val);
                          },
                        ),
                        SizedBox(height: 20.0),
                        TextFormField(
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.white,
                              ),
                              border: OutlineInputBorder(
                                  // width: 0.0 produces a thin "hairline" border
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(90.0)),
                                  borderSide: BorderSide(color: Colors.red)
                                  //borderSide: const BorderSide(),
                                  ),
                              hintStyle: TextStyle(
                                  color: Colors.white, fontFamily: "Segoe UI"),
                              filled: true,
                              fillColor: Colors.white24,
                              hintText: 'Password'),
                          obscureText: true,
                          validator: (val) => val.length < 6
                              ? 'Enter a password 6+ long chars'
                              : null,
                          onChanged: (val) {
                            setState(() => password = val);
                          },
                        ),
                        SizedBox(height: 20.0),
                        SizedBox(
                          height: 55, // specific value

                          child: RaisedButton(
                              color: Colors.red[400],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32.0),
                                side: BorderSide(color: Color(0xFFE22C3C)),
                              ),
                              child: Text(
                                'Sign In',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Segoe UI',
                                    fontSize: 15.0),
                              ),
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  setState(() {
                                    loading = true;
                                  });
                                  dynamic result =
                                      await _auth.signInWithEmailAndPassword(
                                          email, password);
                                  if (result == null) {
                                    setState(() {
                                      error = 'Could not sign in';
                                      loading = false;
                                    });
                                  }
                                }
                              }),
                        ),
                        SizedBox(height: 12.0),
                        Text(
                          error,
                          style: TextStyle(
                              color: Color(0xFFE22C3C),
                              fontSize: 14.0,
                              fontFamily: 'Segoe UI'),
                        ),
                        SizedBox(height: 30.0),
                        Text("Don't Have an account?",style: TextStyle(color: Colors.white, fontFamily: "Segoe UI"),textAlign: TextAlign.center,),
                        SizedBox(height: 12.0),
                        SizedBox(
                          height: 55, // specific value

                          child: RaisedButton(
                              color: Color(0xFFE22C3C),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32.0),
                                side: BorderSide(color: Color(0xFFE22C3C)),
                              ),
                              child: Text(
                                'Register',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Segoe UI',
                                    fontSize: 15.0),
                              ),
                              onPressed: ()  {
                                Navigator.push(context,
                                  MaterialPageRoute(builder: (context)=>Register()),
                                );
                              }),
                        ),
                        SizedBox(height: 230.0),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
