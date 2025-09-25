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

        body: ListView(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 2,
              color: Colors.white,
              margin: const EdgeInsets.all(10),
              child: const Column(
                children: [
                  ListTile(
                    title: Text("张三", style: TextStyle(fontSize: 28)),
                    subtitle: Text("flutter 工程师"),
                  ),
                  Divider(),
                  ListTile(title: Text("电话：13800138000")),
                  ListTile(title: Text("地址：广东省东莞")),
                ],
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 2,
              color: Colors.white,
              margin: const EdgeInsets.all(10),
              child: const Column(
                children: [
                  ListTile(
                    title: Text("张三", style: TextStyle(fontSize: 28)),
                    subtitle: Text("flutter 工程师"),
                  ),
                  Divider(),
                  ListTile(title: Text("电话：13800138000")),
                  ListTile(title: Text("地址：广东省东莞")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
