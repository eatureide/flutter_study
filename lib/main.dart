import 'package:flutter/material.dart';
import 'home_page/index.dart';
import 'detail/index.dart';
import 'exchange/index.dart';
import 'material/index.dart';
import 'count/index.dart';
import 'state/index.dart';

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
  initState() {
    super.initState();
    testSync();
  }

  testSync() async {
    String res = await Future.delayed(Duration(seconds: 2), () {
      return 'hello';
    });
    debugPrint(res);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/state',
      routes: {
        '/': (context) => HomePage(),
        '/detail': (context) => Detail(),
        '/exchange': (context) => ExChange(),
        '/material': (context) => Index(),
        '/count': (context) => CountPage(),
        '/state': (context) => ParentWidget(),
      },
    );
  }
}
