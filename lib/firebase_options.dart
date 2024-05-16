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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyBWHgfTgR4WGwuFa5vhYtAhVOWzPD0Zqis',
    appId: '1:144624772003:web:b0f90de97ccba78c08b016',
    messagingSenderId: '144624772003',
    projectId: 'xfashion-e6a06',
    authDomain: 'xfashion-e6a06.firebaseapp.com',
    storageBucket: 'xfashion-e6a06.appspot.com',
    measurementId: 'G-309B3Y2QLW',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBrTurVvM7zZ6Kvu81T2xoKu_5E-Ah8s5g',
    appId: '1:144624772003:android:548b90c2cd7183ae08b016',
    messagingSenderId: '144624772003',
    projectId: 'xfashion-e6a06',
    storageBucket: 'xfashion-e6a06.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB2nqq6ByTGS6mRmFnMl9doo2zm4DwB6mc',
    appId: '1:144624772003:ios:d34ee2e3809d055f08b016',
    messagingSenderId: '144624772003',
    projectId: 'xfashion-e6a06',
    storageBucket: 'xfashion-e6a06.appspot.com',
    iosBundleId: 'com.example.xfashion',
  );
}