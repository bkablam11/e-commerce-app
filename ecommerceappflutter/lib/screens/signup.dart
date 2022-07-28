// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:ecommerceappflutter/screens/login.dart';
import 'package:ecommerceappflutter/widgets/changescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../widgets/mybutton.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = new RegExp(p);
bool obserText = true;

class _SignUpState extends State<SignUp> {
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
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Form(
        key: _formKey,
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                height: 250,
                width: double.infinity,
                child: Column(mainAxisAlignment: MainAxisAlignment.end,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: <Widget>[
                      Text(
                        "Register",
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ]),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 400,
                margin: EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      TextFormField(
                        validator: (value) {
                          if (value != null && value.isEmpty) {
                            if (value.length < 6) {
                              return "UserName is Too Short";
                            } else if (value == "") {
                              return "Please Fill UserName";
                            }
                            return "";
                          }
                        },
                        decoration: InputDecoration(
                          hintText: "UserName",
                          //#TODO: add suffixicon
                          hintStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(),
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
                          hintText: "Email",
                          //#TODO: add suffixicon
                          hintStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(),
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
                          hintText: "Password",
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                obserText = !obserText;
                              });
                              FocusScope.of(context).unfocus();
                            },
                            child: Icon(
                              obserText == true
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.black,
                            ),
                          ),
                          hintStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value != null && value.isEmpty) {
                            if (value == "") {
                              return "Please Fill Phone Number";
                            } else if (value.length < 11) {
                              return "Phone Number Must Be 11";
                            }
                            return "";
                          }
                        },
                        decoration: InputDecoration(
                          hintText: "Phone Number",
                          //#TODO: add suffixicon
                          hintStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      MyButton(
                        onPressed: () {
                          vaildation();
                        },
                        name: "SignUp",
                      ),
                      ChangeScreen(
                          name: "Login",
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (ctx) => Login()));
                          },
                          whichAccount: "I Have Already An Account !"),
                    ]),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
