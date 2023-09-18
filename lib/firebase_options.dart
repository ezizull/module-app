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
    apiKey: 'AIzaSyD4vVISSNlPUaaVnMUE3HaO_w3I1qLAwnM',
    appId: '1:966792007055:web:ce6ae65ca155196c90cffa',
    messagingSenderId: '966792007055',
    projectId: 'news-app-ad40b',
    authDomain: 'news-app-ad40b.firebaseapp.com',
    storageBucket: 'news-app-ad40b.appspot.com',
    measurementId: 'G-ZWRH537HWC',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDCsQIiEvaiZoGCALiRVLIknG0jYvrcCQs',
    appId: '1:966792007055:android:05d8d9de85acd4b390cffa',
    messagingSenderId: '966792007055',
    projectId: 'news-app-ad40b',
    storageBucket: 'news-app-ad40b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBmApoqHikHi35w0108SCe1J8lMb-GS7oA',
    appId: '1:966792007055:ios:50b8687c4008d56c90cffa',
    messagingSenderId: '966792007055',
    projectId: 'news-app-ad40b',
    storageBucket: 'news-app-ad40b.appspot.com',
    iosBundleId: 'com.example.moduleApp',
  );
}
