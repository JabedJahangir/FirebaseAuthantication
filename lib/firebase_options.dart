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
    apiKey: 'AIzaSyAs386gWWkfRrWRs89RB6Czi2UUOsBEpwo',
    appId: '1:830485112129:web:532b15fdecb0ada197adc0',
    messagingSenderId: '830485112129',
    projectId: 'fir-task2-63a30',
    authDomain: 'fir-task2-63a30.firebaseapp.com',
    storageBucket: 'fir-task2-63a30.firebasestorage.app',
    measurementId: 'G-4XK7G3F9XN',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBchSGe363EPNa5EtmK30OIkG-rsYc-3qM',
    appId: '1:830485112129:android:338d4723eaf31cc097adc0',
    messagingSenderId: '830485112129',
    projectId: 'fir-task2-63a30',
    storageBucket: 'fir-task2-63a30.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB3Iy6bF-rq1Hz9PBpFZW4ckb9NiQSYIDQ',
    appId: '1:830485112129:ios:a02ff30a18d1415297adc0',
    messagingSenderId: '830485112129',
    projectId: 'fir-task2-63a30',
    storageBucket: 'fir-task2-63a30.firebasestorage.app',
    iosBundleId: 'com.example.firebasetask2',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB3Iy6bF-rq1Hz9PBpFZW4ckb9NiQSYIDQ',
    appId: '1:830485112129:ios:a02ff30a18d1415297adc0',
    messagingSenderId: '830485112129',
    projectId: 'fir-task2-63a30',
    storageBucket: 'fir-task2-63a30.firebasestorage.app',
    iosBundleId: 'com.example.firebasetask2',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAs386gWWkfRrWRs89RB6Czi2UUOsBEpwo',
    appId: '1:830485112129:web:ef3171ce2399779797adc0',
    messagingSenderId: '830485112129',
    projectId: 'fir-task2-63a30',
    authDomain: 'fir-task2-63a30.firebaseapp.com',
    storageBucket: 'fir-task2-63a30.firebasestorage.app',
    measurementId: 'G-LHBD1JP4W3',
  );
}
