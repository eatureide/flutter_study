import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/gestures.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body: AnimatedPaddingPage()));
  }
}

class AnimatedPaddingPage extends StatefulWidget {
  const AnimatedPaddingPage({super.key});

  @override
  State createState() => _AnimatedPaddingPageState();
}

class _AnimatedPaddingPageState extends State {
  bool flag = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.change_circle),
        onPressed: () {
          setState(() {
            flag = !flag;
          });
        },
      ),
      appBar: AppBar(title: const Text('AnimatedPadding')),
      body: AnimatedPadding(
        duration: const Duration(milliseconds: 3000),
        padding: EdgeInsets.fromLTRB(10, flag ? 10 : 500, 0, 0),
        curve: Curves.bounceInOut,
        child: Container(width: 100, height: 100, color: Colors.red),
      ),
    );
  }
}
