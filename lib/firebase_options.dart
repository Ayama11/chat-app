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
    apiKey: 'AIzaSyAaCmivPh6t_4tfiJyeGUIqEbeeSa_bx78',
    appId: '1:592754791801:web:205964da8ad2e95dba4ba8',
    messagingSenderId: '592754791801',
    projectId: 'teettt-a5a6d',
    authDomain: 'teettt-a5a6d.firebaseapp.com',
    storageBucket: 'teettt-a5a6d.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAaX4xinc1sJsj68bf1CwBPd032oM-bqVU',
    appId: '1:592754791801:android:e763ac47a737a3d0ba4ba8',
    messagingSenderId: '592754791801',
    projectId: 'teettt-a5a6d',
    storageBucket: 'teettt-a5a6d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDONLenJRIkqNuZjPnlKWYbxrOBIguJ97g',
    appId: '1:592754791801:ios:6eb4a42aa5a83842ba4ba8',
    messagingSenderId: '592754791801',
    projectId: 'teettt-a5a6d',
    storageBucket: 'teettt-a5a6d.appspot.com',
    iosBundleId: 'com.example.teste',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDONLenJRIkqNuZjPnlKWYbxrOBIguJ97g',
    appId: '1:592754791801:ios:33dc4e7a94298d7bba4ba8',
    messagingSenderId: '592754791801',
    projectId: 'teettt-a5a6d',
    storageBucket: 'teettt-a5a6d.appspot.com',
    iosBundleId: 'com.example.teste.RunnerTests',
  );
}