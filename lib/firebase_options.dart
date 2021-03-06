// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    // ignore: missing_enum_constant_in_switch
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
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCT8KoRA2X49IjhFbmgwPIP0gHHBfNweH0',
    appId: '1:787146938723:android:64afc9785eec899dd89b56',
    messagingSenderId: '787146938723',
    projectId: 'flutter-rehabiri',
    storageBucket: 'flutter-rehabiri.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCZ1VNS588LUow8wjwxSLj-n9gzWr3zd8o',
    appId: '1:787146938723:ios:e9e4b559e51dcd52d89b56',
    messagingSenderId: '787146938723',
    projectId: 'flutter-rehabiri',
    storageBucket: 'flutter-rehabiri.appspot.com',
    iosClientId: '787146938723-19r74o66th47svoc8lmb89qhil6i8f9l.apps.googleusercontent.com',
    iosBundleId: 'net.gleamingcake.test.flutter',
  );
}
