import 'package:flutter/material.dart';
import 'package:fluttertodoapp/controller_binding.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertodoapp/screens/intro.dart';

Future<void> main() async {
  //WidgetsFlutterBinding.ensureInitialized();
  //await Firebase
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyDAeoqIxVholNdUwSjKeKWO0Ims9_LEqI4",
      appId: "1:549417096314:android:a049dca4ad958e17bb97c3",
      messagingSenderId: "549417096314",
      projectId: "todo-yt-b1007",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Intro(),
      initialBinding: ControllerBindings(),
    );
  }
}
