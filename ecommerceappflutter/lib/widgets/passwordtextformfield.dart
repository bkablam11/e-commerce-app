import 'package:flutter/material.dart';

class PasswordTextFormField extends StatelessWidget {
  final bool obserText;
  //final TextEditingController controller;
  final String name;
  final Function onTap;
  final Function validator;

  PasswordTextFormField({
    //required this.controller,
    required this.onTap,
    required this.name,
    required this.obserText,
    required this.validator,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      //controller: controller,
      obscureText: obserText,
      validator: validator(),
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: name,
        suffixIcon: GestureDetector(
          onTap: onTap(),
          child: Icon(
            obserText == true ? Icons.visibility : Icons.visibility_off,
            color: Colors.black,
          ),
        ),
        hintStyle: TextStyle(color: Colors.black),
      ),
    );
  }
}
