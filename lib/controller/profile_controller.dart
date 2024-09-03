import 'package:flutter/material.dart';
import 'package:netflix/view/profile/profile_view.dart';

class ProfileController extends StatelessWidget {
  const ProfileController({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(top: 15),
            child: const Text(
              "Your Profile",
              style: TextStyle(fontSize: 30),
            ),
          ),
          automaticallyImplyLeading: false,
        ),
        body: const ProfileView());
  }
}
