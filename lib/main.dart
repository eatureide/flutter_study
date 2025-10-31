import 'package:flutter/material.dart';
import 'home_page/index.dart';
import 'detail/index.dart';
import 'exchange/index.dart';
import 'material/index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/material',
      routes: {
        '/': (context) => HomePage(),
        '/detail': (context) => Detail(),
        '/exchange': (context) => ExChange(),
        '/material': (context) => Index(),
      },
    );
  }
}
