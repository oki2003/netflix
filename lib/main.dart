import 'package:firebase_core/firebase_core.dart';
import "package:netflix/controller/login_controller.dart" show LoginController;
import "package:netflix/controller/playvideo_controller.dart"
    show PlayVideoController;
import "package:netflix/controller/signup_controller.dart"
    show SignUpController;
import 'package:netflix/firebase_options.dart';
import "package:flutter/material.dart";
import "package:netflix/controller/main_controller.dart" show MainController;
import 'package:netflix/view/profile/takePicture_view.dart';
import 'package:camera/camera.dart';
import "package:netflix/view/profile/uploadPicture_view.dart";

// void main() {
//   runApp(const MyApp());
// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();

  // Get a specific camera from the list of available cameras.
  final firstCamera1 = cameras.first;
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp(firstCamera: firstCamera1));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.firstCamera});
  final firstCamera;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginController(),
        '/signup': (context) => const SignUpController(),
        '/main_controller': (context) => const MainController(),
        '/playvideo_controller': (context) => const PlayVideoController(),
        '/takePictureScreen': (context) =>
            TakePictureScreen(camera: firstCamera),
        '/uploadPicture': (context) => const UploadPictureView()
      },
    );
  }
}
