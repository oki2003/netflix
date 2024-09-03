import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<bool> signUp(String email, String password, String username) async {
  try {
    final userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    // Cập nhật hồ sơ người dùng với username
    await userCredential.user!.updateDisplayName(username);

    // Lưu trữ username hoặc các thông tin khác của người dùng vào Firestore
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userCredential.user!.uid)
        .set({
      'username': username,
    });
    return true;
  } catch (e) {
    return false;
  }
}
