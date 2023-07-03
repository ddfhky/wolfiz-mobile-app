import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDzlrH-9_4ef11_9MQrqtBIPkpahjG9A78",
            authDomain: "wolfiz-1de25.firebaseapp.com",
            projectId: "wolfiz-1de25",
            storageBucket: "wolfiz-1de25.appspot.com",
            messagingSenderId: "344241116607",
            appId: "1:344241116607:web:724744b9eb1da97af0bd0a",
            measurementId: "G-C2CWEEGJK7"));
  } else {
    await Firebase.initializeApp();
  }
}
