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
    return MaterialApp(
      home: Scaffold(
        body: AnimatedOpacityPage(),
      ),
    );
  }
}

class AnimatedOpacityPage extends StatefulWidget {
  const AnimatedOpacityPage({super.key});

  @override
  State createState() => _AnimatedOpacityPageState();
}

class _AnimatedOpacityPageState extends State {
  bool flag = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            flag = !flag;
          });
        },
        child: const Icon(Icons.opacity),
      ),
      appBar: AppBar(title: const Text('AnimatedOpacity')),
      body: Center(
        child: AnimatedOpacity(
          opacity: flag ? 0 : 1,
          duration: const Duration(milliseconds: 300),
          curve: Curves.linear,
          child: Container(width: 300, height: 300, color: Colors.blue),
        ),
      ),
    );
  }
}
