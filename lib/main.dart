import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:GTuner/control/auth/auth_bind.dart';
import 'package:GTuner/control/auth/auth_control.dart';
import 'package:get/get.dart';
import 'package:GTuner/screens/home/home.dart';
import 'package:GTuner/screens/login.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await getImages().then((value) => chords.value = value);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(MyApp()));
}

var chords = [].obs;

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

Future<List> getImages() async {
  var files = await rootBundle.loadString('AssetManifest.json');
  Map<String, dynamic> images = json.decode(files);
  List chords = images.keys
      .where((String key) => key.contains('images/chords/'))
      .toList();
  return chords;
}
