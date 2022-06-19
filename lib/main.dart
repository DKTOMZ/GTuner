import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in_dartio/google_sign_in_dartio.dart';
import 'package:login_signup/const%20&%20control/auth/auth_bind.dart';
import 'package:login_signup/const%20&%20control/auth/auth_control.dart';
import 'package:get/get.dart';
import 'package:login_signup/screens/home.dart';
import 'package:login_signup/screens/login.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isLinux) {
    await GoogleSignInDart.register(
        clientId:
            '858261065485-ls966kfh93pi7hiucdqhcojr9con5knc.apps.googleusercontent.com');
  }
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final Future<FirebaseApp> _initialization =
      Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FirebaseApp>(
      future: _initialization,
      builder: (_, AsyncSnapshot<FirebaseApp> snapshot) {
        if (snapshot.hasError) {
          return Container(
            color: Colors.black,
            child: Text(
              snapshot.error.toString(),
              textDirection: TextDirection.ltr,
              style: const TextStyle(color: Colors.red),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return GetMaterialApp(
              darkTheme: ThemeData.dark(),
              themeMode: ThemeMode.dark,
              debugShowCheckedModeBanner: false,
              initialBinding: AuthBinding(),
              home:
                  AuthController().user != 'No User' ? const Home() : Login());
        }
        return Container(
          color: Colors.black,
          child: CircularProgressIndicator(color: Colors.amber.shade700),
        );
      },
    );
  }
}
