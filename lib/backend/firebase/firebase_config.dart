import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyChpxSHxrQk9ee3k1BFxYklSTgRs0FcYe4",
            authDomain: "docspeak-k9hifo.firebaseapp.com",
            projectId: "docspeak-k9hifo",
            storageBucket: "docspeak-k9hifo.appspot.com",
            messagingSenderId: "825915232006",
            appId: "1:825915232006:web:171d309d8bbc7dbab69887"));
  } else {
    await Firebase.initializeApp();
  }
}
