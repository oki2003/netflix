// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDOZXsJdDWyhuEJhISK7iBlPFI2qx4B5tU',
    appId: '1:953080513977:web:3cbaa58cdc8184e20b2268',
    messagingSenderId: '953080513977',
    projectId: 'users-management-972cf',
    authDomain: 'users-management-972cf.firebaseapp.com',
    storageBucket: 'users-management-972cf.appspot.com',
    measurementId: 'G-P2LXJDN3YD',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDBMjCICBnTm2F-t1W8-kPaaTlK0nATHLY',
    appId: '1:953080513977:android:42f1adff0f9518b70b2268',
    messagingSenderId: '953080513977',
    projectId: 'users-management-972cf',
    storageBucket: 'users-management-972cf.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBanOB7D4SxfjnQCLdarU9533xgCd7OgiA',
    appId: '1:953080513977:ios:8b1006c870eebedc0b2268',
    messagingSenderId: '953080513977',
    projectId: 'users-management-972cf',
    storageBucket: 'users-management-972cf.appspot.com',
    iosBundleId: 'com.example.netflix',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBanOB7D4SxfjnQCLdarU9533xgCd7OgiA',
    appId: '1:953080513977:ios:8b1006c870eebedc0b2268',
    messagingSenderId: '953080513977',
    projectId: 'users-management-972cf',
    storageBucket: 'users-management-972cf.appspot.com',
    iosBundleId: 'com.example.netflix',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDOZXsJdDWyhuEJhISK7iBlPFI2qx4B5tU',
    appId: '1:953080513977:web:b466c82b6ef6a31e0b2268',
    messagingSenderId: '953080513977',
    projectId: 'users-management-972cf',
    authDomain: 'users-management-972cf.firebaseapp.com',
    storageBucket: 'users-management-972cf.appspot.com',
    measurementId: 'G-4XRCQ78QSC',
  );
}