import 'package:flutter/material.dart';
import 'package:netflix/view/signup_view.dart';

class SignUpController extends StatefulWidget {
  const SignUpController({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SignUpController();
  }
}

class _SignUpController extends State<SignUpController> {
  @override
  Widget build(BuildContext context) {
    return SignUpView();
  }
}
