import 'package:firebase_auth/firebase_auth.dart';

Future<String?> signIn(String email, String password) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return '';
  } on FirebaseAuthException catch (_) {
    return 'No user found.';
  }
}

bool checkCurrentSignIn() {
  if (FirebaseAuth.instance.currentUser != null) {
    return true;
  } else {
    return false;
  }
}
