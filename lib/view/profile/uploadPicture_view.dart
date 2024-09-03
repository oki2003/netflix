import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class UploadPictureView extends StatelessWidget {
  const UploadPictureView({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final imagePath = ModalRoute.of(context)!.settings.arguments as String;
      if (FirebaseAuth.instance.currentUser?.photoURL == null) {
        final fileName = '${DateTime.now().millisecondsSinceEpoch}.jpg';
        final storageRef = FirebaseStorage.instance.ref('images/$fileName');
        try {
          await storageRef.putFile(File(imagePath));
          final downloadUrl = await storageRef.getDownloadURL();
          try {
            await FirebaseAuth.instance.currentUser
                ?.updatePhotoURL(downloadUrl);
            Navigator.pop(context);
            Navigator.pop(context);
            Navigator.pop(context);
          } on FirebaseException catch (e) {
            print("upload xong nhung cap nhat bi loi");
            print(e);
          }
        } on FirebaseException catch (e) {
          print("upload anh nhung chua cap nhat");
          print(e);
        }
      } else {
        final photoUrl = FirebaseAuth.instance.currentUser?.photoURL;
        if (photoUrl != null) {
          final storageRef = FirebaseStorage.instance.refFromURL(photoUrl);

          try {
            await storageRef.delete();

            final fileName = '${DateTime.now().millisecondsSinceEpoch}.jpg';
            FirebaseStorage.instance.ref('images/$fileName');
            try {
              await storageRef.putFile(File(imagePath));
              final downloadUrl = await storageRef.getDownloadURL();
              try {
                await FirebaseAuth.instance.currentUser
                    ?.updatePhotoURL(downloadUrl);
                Navigator.pushNamed(context, '/main_controller');
              } on FirebaseException catch (e) {
                print("upload xong nhung cap nhat bi loi");
                print(e);
              }
            } on FirebaseException catch (e) {
              print("upload anh nhung chua cap nhat");
              print(e);
            }
          } on FirebaseException catch (e) {
            print("xoa that bai: $e");
          }
        }
      }
    });
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 10),
            Text("The picture is uploading...")
          ],
        ),
      ),
    );
  }
}
