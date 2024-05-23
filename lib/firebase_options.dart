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
    apiKey: 'AIzaSyCQDpcFiohyHMZkN2XaVralHU5tzqG3fsg',
    appId: '1:48111034768:web:268ce0b581f0f07b17d315',
    messagingSenderId: '48111034768',
    projectId: 'stray-care-e8c02',
    authDomain: 'stray-care-e8c02.firebaseapp.com',
    storageBucket: 'stray-care-e8c02.appspot.com',
    measurementId: 'G-MR6QD38KNT',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBlOSpDXyUnC0iv5CPYPsQOdr6EdY6qIbg',
    appId: '1:48111034768:android:b3deddd51980631617d315',
    messagingSenderId: '48111034768',
    projectId: 'stray-care-e8c02',
    storageBucket: 'stray-care-e8c02.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD3_8b7en_UUtSIf35eVVYGqHWLjoz1iYs',
    appId: '1:48111034768:ios:b9551065be98247717d315',
    messagingSenderId: '48111034768',
    projectId: 'stray-care-e8c02',
    storageBucket: 'stray-care-e8c02.appspot.com',
    iosBundleId: 'com.example.strayCareAdmin',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD3_8b7en_UUtSIf35eVVYGqHWLjoz1iYs',
    appId: '1:48111034768:ios:b9551065be98247717d315',
    messagingSenderId: '48111034768',
    projectId: 'stray-care-e8c02',
    storageBucket: 'stray-care-e8c02.appspot.com',
    iosBundleId: 'com.example.strayCareAdmin',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCQDpcFiohyHMZkN2XaVralHU5tzqG3fsg',
    appId: '1:48111034768:web:0db108fc43d9726617d315',
    messagingSenderId: '48111034768',
    projectId: 'stray-care-e8c02',
    authDomain: 'stray-care-e8c02.firebaseapp.com',
    storageBucket: 'stray-care-e8c02.appspot.com',
    measurementId: 'G-6CBFMZS7XL',
  );
}