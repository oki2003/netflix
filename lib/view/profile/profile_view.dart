import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:netflix/view/profile/edit/editName_view.dart';
import 'package:netflix/view/profile/edit/editPassword_view.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});
  @override
  State<StatefulWidget> createState() {
    return _ProfileView();
  }
}

class _ProfileView extends State<ProfileView> {
  User? user = FirebaseAuth.instance.currentUser;
  String? _name = "";
  final _formKey = GlobalKey<FormState>();
  final controller = TextEditingController();
  final rePassController = TextEditingController();
  void changeInfo(String title) {
    showDialog(
      context: context,
      builder: (context) {
        controller.text = "";
        rePassController.text = "";
        return AlertDialog(
          title: title == "password"
              ? const Text("")
              : title == "camera"
                  ? const Text("Do you want to change your picture?")
                  : Text("Enter your new $title"),
          content: Form(
              key: _formKey,
              child: title == "password"
                  ? EditPasswordView(
                      controller: controller,
                      rePassController: rePassController,
                      title: title)
                  : title == "name"
                      ? EditnameView(controller: controller, title: title)
                      : const Text("")),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Cancel")),
            ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    if (title == "name") {
                      try {
                        await user?.updateDisplayName(controller.text);
                        setState(() {
                          _name = controller.text;
                        });
                      } on FirebaseAuthException catch (_) {
                        Navigator.of(context).pop();
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    "Something's wrong. Please try again!")));
                      }
                      Navigator.of(context).pop();
                    } else if (title == "password") {
                      AuthCredential credential = EmailAuthProvider.credential(
                        email: user!.email!,
                        password: rePassController.text,
                      );
                      try {
                        await user?.reauthenticateWithCredential(credential);
                        try {
                          await user?.updatePassword(controller.text);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    Text("Your password changes sucessfully!")),
                          );
                        } on FirebaseAuthException catch (_) {
                          Navigator.of(context).pop();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    "Something's wrong. Please change your password again!")),
                          );
                        }
                        ;
                      } on FirebaseAuthException catch (_) {
                        Navigator.of(context).pop();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content:
                                  Text("Your current password is not correct")),
                        );
                      }
                      Navigator.of(context).pop();
                    } else {
                      Navigator.pushNamed(context, '/takePictureScreen');
                    }
                  }
                },
                child: const Text("Change"))
          ],
        );
      },
    );
  }

  @override
  void initState() {
    _name = user?.displayName;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future<ImageProvider> loadImage() async {
      try {
        final imageProvider;
        if (FirebaseAuth.instance.currentUser?.photoURL == null) {
          imageProvider = const NetworkImage(
              "https://static.vecteezy.com/system/resources/previews/009/292/244/original/default-avatar-icon-of-social-media-user-vector.jpg");
        } else {
          imageProvider = NetworkImage("${user?.photoURL}");
        }
        // Preload the image to ensure it's cached and ready to display
        await precacheImage(imageProvider, context);
        return imageProvider;
      } catch (e) {
        // Handle any errors that occur during image loading
        print('Error loading image: $e');
        rethrow;
      }
    }

    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        children: [
          const SizedBox(height: 15),
          InkWell(
            onTap: () {
              changeInfo("camera");
            },
            child: Stack(alignment: Alignment.bottomRight, children: [
              // CircleAvatar(
              //   radius: 80.0,
              //   backgroundColor: Colors.green,
              //   backgroundImage: NetworkImage((user?.photoURL == null)
              //       ? "https://static.vecteezy.com/system/resources/previews/009/292/244/original/default-avatar-icon-of-social-media-user-vector.jpg"
              //       : "${user?.photoURL}"),
              // ),
              FutureBuilder(
                future: loadImage(), // Hàm load ảnh
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Container(
                      width: 100,
                      height: 100,
                      child: const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
                      ),
                    );
                  } else if (snapshot.hasData) {
                    return CircleAvatar(
                      radius: 80.0,
                      backgroundImage: snapshot.data as ImageProvider,
                    );
                  } else {
                    return const SizedBox.shrink(); // Nếu lỗi, không hiện gì
                  }
                },
              ),
              const Icon(Icons.camera_alt),
            ]),
          ),
          const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Name",
                style: TextStyle(height: 2),
              )),
          Row(
            children: [
              Expanded(
                flex: 9,
                child: TextField(
                  readOnly: true,
                  decoration: InputDecoration(
                      hintText: _name,
                      contentPadding: const EdgeInsets.only(left: 10),
                      enabledBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Colors.white)),
                      focusedBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Colors.white)),
                      fillColor: const Color.fromRGBO(51, 51, 51, 1.0),
                      filled: true),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: IconButton(
                      onPressed: () {
                        changeInfo("name");
                      },
                      icon: const Icon(Icons.edit_note)))
            ],
          ),
          const SizedBox(height: 20),
          const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Email",
                style: TextStyle(height: 2),
              )),
          Row(
            children: [
              Expanded(
                flex: 9,
                child: TextField(
                  readOnly: true,
                  decoration: InputDecoration(
                      hintText: "${user?.email}",
                      contentPadding: const EdgeInsets.only(left: 10),
                      enabledBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Colors.white)),
                      focusedBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Colors.white)),
                      fillColor: const Color.fromRGBO(51, 51, 51, 1.0),
                      filled: true),
                ),
              ),
              const Expanded(flex: 1, child: SizedBox())
            ],
          ),
          const SizedBox(height: 20),
          const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Password",
                style: TextStyle(height: 2),
              )),
          Row(
            children: [
              const Expanded(
                flex: 9,
                child: TextField(
                  readOnly: true,
                  decoration: InputDecoration(
                      hintText: "********",
                      contentPadding: EdgeInsets.only(left: 10),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Colors.white)),
                      fillColor: Color.fromRGBO(51, 51, 51, 1.0),
                      filled: true),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: IconButton(
                      onPressed: () {
                        changeInfo("password");
                      },
                      icon: const Icon(Icons.edit_note)))
            ],
          ),
          const SizedBox(height: 50),
          OutlinedButton(
            onPressed: () async {
              if (FirebaseAuth.instance.currentUser != null) {
                await FirebaseAuth.instance.signOut();
                Navigator.pushNamed(context, '/');
              }
            },
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                SizedBox(width: 10),
                Text(
                  "Log out",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
