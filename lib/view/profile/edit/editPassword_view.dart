import 'package:flutter/material.dart';

class EditPasswordView extends StatelessWidget {
  const EditPasswordView(
      {super.key,
      required this.controller,
      required this.rePassController,
      required this.title});
  final TextEditingController controller;
  final TextEditingController rePassController;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          "Enter your current password",
          style: TextStyle(fontSize: 15, height: 3),
        ),
        TextFormField(
          controller: rePassController,
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
        ),
        const Text(
          "Enter your new password",
          style: TextStyle(fontSize: 15, height: 3),
        ),
        TextFormField(
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
        )
      ],
    );
  }
}
