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
        appBar: AppBar(title: const Text('Hello Flutter App')),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              width: 100,
              height: 100,
              color: Colors.red,
              child: Text(
                '1',
                style: TextStyle(color: Colors.white, fontSize: 60),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              width: 100,
              height: 100,
              color: Colors.yellow,
              child: Text(
                '2',
                style: TextStyle(color: Colors.white, fontSize: 60),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              width: 100,
              height: 100,
              color: Colors.blue,
              child: Text(
                '3',
                style: TextStyle(color: Colors.white, fontSize: 60),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
