import 'package:flutter/material.dart';
import 'package:netflix/model/Authentication/sign_in.dart';
import 'package:netflix/view/login_view.dart';

class LoginController extends StatefulWidget {
  const LoginController({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginController();
  }
}

class _LoginController extends State<LoginController> {
  @override
  Widget build(BuildContext context) {
    if (checkCurrentSignIn() == true) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushNamed(context, '/main_controller');
      });
      return Container();
    } else {
      return LoginView();
    }
  }
}
