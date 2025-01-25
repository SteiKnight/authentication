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
    apiKey: 'AIzaSyBF6VShpZdxOc9Ll7YdlCkF-B9xGvvtolM',
    appId: '1:253623233292:web:232326201180527a187729',
    messagingSenderId: '253623233292',
    projectId: 'authentication-9743b',
    authDomain: 'authentication-9743b.firebaseapp.com',
    storageBucket: 'authentication-9743b.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyClwe2MehJSeNgdK4UISg50irRN7h60aGM',
    appId: '1:253623233292:android:915ec7d045719892187729',
    messagingSenderId: '253623233292',
    projectId: 'authentication-9743b',
    storageBucket: 'authentication-9743b.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBV3nfZjXRbd7R318TqPa5a9f-Hd8iUaic',
    appId: '1:253623233292:ios:9908f9d4a2d935a6187729',
    messagingSenderId: '253623233292',
    projectId: 'authentication-9743b',
    storageBucket: 'authentication-9743b.firebasestorage.app',
    iosBundleId: 'com.example.authentication',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBV3nfZjXRbd7R318TqPa5a9f-Hd8iUaic',
    appId: '1:253623233292:ios:9908f9d4a2d935a6187729',
    messagingSenderId: '253623233292',
    projectId: 'authentication-9743b',
    storageBucket: 'authentication-9743b.firebasestorage.app',
    iosBundleId: 'com.example.authentication',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBF6VShpZdxOc9Ll7YdlCkF-B9xGvvtolM',
    appId: '1:253623233292:web:574ee0e87a795f73187729',
    messagingSenderId: '253623233292',
    projectId: 'authentication-9743b',
    authDomain: 'authentication-9743b.firebaseapp.com',
    storageBucket: 'authentication-9743b.firebasestorage.app',
  );
}
