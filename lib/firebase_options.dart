// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDbyPzVAougnfLzrIniQN8LD7gZBlZ5rmk',
    appId: '1:557550374095:web:e457a8654ed9656a5e3bba',
    messagingSenderId: '557550374095',
    projectId: 'fir-amv-cb104',
    authDomain: 'fir-amv-cb104.firebaseapp.com',
    databaseURL: 'https://fir-amv-cb104-default-rtdb.firebaseio.com',
    storageBucket: 'fir-amv-cb104.appspot.com',
    measurementId: 'G-CP8648MXRZ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA55Zd_O32kxHEjJk1qqyuDLucwPkM2fJM',
    appId: '1:557550374095:android:d03525af5fa4b5a75e3bba',
    messagingSenderId: '557550374095',
    projectId: 'fir-amv-cb104',
    databaseURL: 'https://fir-amv-cb104-default-rtdb.firebaseio.com',
    storageBucket: 'fir-amv-cb104.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDd5SepCPCDFRy4R5VSOzJPpF7uqReh1yk',
    appId: '1:557550374095:ios:7ed1f41607b1e8ac5e3bba',
    messagingSenderId: '557550374095',
    projectId: 'fir-amv-cb104',
    databaseURL: 'https://fir-amv-cb104-default-rtdb.firebaseio.com',
    storageBucket: 'fir-amv-cb104.appspot.com',
    iosClientId: '557550374095-7ddj3um7ltuhdh52hth3kk6afstsoje9.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebaseGoogleAuth',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDd5SepCPCDFRy4R5VSOzJPpF7uqReh1yk',
    appId: '1:557550374095:ios:7ed1f41607b1e8ac5e3bba',
    messagingSenderId: '557550374095',
    projectId: 'fir-amv-cb104',
    databaseURL: 'https://fir-amv-cb104-default-rtdb.firebaseio.com',
    storageBucket: 'fir-amv-cb104.appspot.com',
    iosClientId: '557550374095-7ddj3um7ltuhdh52hth3kk6afstsoje9.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebaseGoogleAuth',
  );
}
