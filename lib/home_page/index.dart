import 'package:flutter/material.dart';
import '../nav.dart';
import '../shop.dart';
import '../classification/index.dart';
import '../home.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> pageList = const [Home(), Shop(), Classification()];

  onTap(flag) {
    setState(() {
      _currentIndex = flag;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Nav(onTap: onTap, currentIndex: _currentIndex),
      body: pageList[_currentIndex],
    );
  }
}
