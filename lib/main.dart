import 'package:flutter/material.dart';
import 'nav.dart';
import 'home.dart';
import 'shop.dart';
import 'classification/index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  int _currentIndex = 2;

  final List<Widget> pageList = const [Home(), Shop(), Classification()];

  onTap(flag) {
    setState(() {
      _currentIndex = flag;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        bottomNavigationBar: Nav(onTap: onTap, currentIndex: _currentIndex),
        body: pageList[_currentIndex],
      ),
    );
  }
}
