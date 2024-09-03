import 'package:flutter/material.dart';

class EditnameView extends StatelessWidget {
  const EditnameView(
      {super.key, required this.controller, required this.title});
  final TextEditingController controller;
  final String title;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: const InputDecoration(
          contentPadding: EdgeInsets.only(left: 10),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.white)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.white)),
          fillColor: Color.fromRGBO(51, 51, 51, 1.0),
          filled: true),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter you new $title";
        } else {
          return null;
        }
      },
    );
  }
}
