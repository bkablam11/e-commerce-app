// ignore_for_file: prefer_const_constructors

import 'package:ecommerceappflutter/screens/signup.dart';
import 'package:ecommerceappflutter/widgets/changescreen.dart';
import 'package:ecommerceappflutter/widgets/mybutton.dart';
import 'package:ecommerceappflutter/widgets/mytextformField.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = new RegExp(p);
bool obserText = true;

class _LoginState extends State<Login> {
  void vaildation() {
    if (_formKey.currentState!.validate()) {
      print("Yes");
    } else {
      print("No");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
              Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          if (value == "") {
                            return "Please Fill Email";
                          } else if (!regExp.hasMatch(value)) {
                            return "Email is Invalid";
                          }
                          return "";
                        }
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Email",
                        hintStyle: TextStyle(color: Colors.black),
                      ),
                    ),
                    TextFormField(
                      obscureText: obserText,
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          if (value == "") {
                            return "Please Fill Password";
                          } else if (value.length < 8) {
                            return "Password is Too Short";
                          }
                          return "";
                        }
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Password",
                          hintStyle: TextStyle(color: Colors.black),
                          suffixIcon: GestureDetector(
                            child: Icon(
                              obserText == true
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.black,
                            ),
                          )),
                    ),
                    MyButton(
                      onPressed: () {
                        vaildation();
                      },
                      name: "Login",
                    ),
                    ChangeScreen(
                        name: "SignUp",
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (ctx) => SignUp()));
                        },
                        whichAccount: "I Have Not Account !"),
                  ]),
            )
          ]),
        ),
      ),
    );
  }
}
