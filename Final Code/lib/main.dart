// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:project_v1/pages/FirstPage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home:  FirstPage(),
    );
    
  }
}
