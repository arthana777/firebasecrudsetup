
import 'package:firebase_core/firebase_core.dart';
import 'package:firebasecrudsetup/readdata.dart';
import 'package:flutter/material.dart';

import 'homescreen.dart';


Future main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
      ),
      home: ReadData(),
    );
  }
}
