import 'package:flutter/material.dart';
import 'presentations/splash_screen.dart';
import 'presentations/screen1.dart';
import 'route/route.dart';
// import 'presentations/dart.dart';
import 'presentations/work.dart';

void main(){
  runApp(
    MyApp()
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: pay100(),
    );
  }
}