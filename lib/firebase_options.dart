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
    apiKey: 'AIzaSyCcsDOSkbUASl53FJW4G0aUD_HBGiLQMlQ',
    appId: '1:269564714995:web:6782b862f0e21bb5273c86',
    messagingSenderId: '269564714995',
    projectId: 'market-smart-device',
    authDomain: 'market-smart-device.firebaseapp.com',
    storageBucket: 'market-smart-device.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCZ1IV5mgMn9nOmJZzfzAXT4PulI3yMyeU',
    appId: '1:269564714995:android:e79a3c52c90dcf80273c86',
    messagingSenderId: '269564714995',
    projectId: 'market-smart-device',
    storageBucket: 'market-smart-device.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB9bkl_-ZYdnh9EBePEZV9luN6OGvteI9o',
    appId: '1:269564714995:ios:b529c71f026691e7273c86',
    messagingSenderId: '269564714995',
    projectId: 'market-smart-device',
    storageBucket: 'market-smart-device.appspot.com',
    iosBundleId: 'com.example.cloneChat',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB9bkl_-ZYdnh9EBePEZV9luN6OGvteI9o',
    appId: '1:269564714995:ios:b529c71f026691e7273c86',
    messagingSenderId: '269564714995',
    projectId: 'market-smart-device',
    storageBucket: 'market-smart-device.appspot.com',
    iosBundleId: 'com.example.cloneChat',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCcsDOSkbUASl53FJW4G0aUD_HBGiLQMlQ',
    appId: '1:269564714995:web:4bdec07c9059b35c273c86',
    messagingSenderId: '269564714995',
    projectId: 'market-smart-device',
    authDomain: 'market-smart-device.firebaseapp.com',
    storageBucket: 'market-smart-device.appspot.com',
  );
}
