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
        body: MyHomePage(),
      ),
    );
  }
}

// 主页
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State createState() => _MyHomePageState();
}

class _MyHomePageState extends State {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("微信")),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        // BottomNavigationBar 的点击事件
        onTap: (flag) {
          setState(() {
            _currentIndex = flag;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('images/wc_gray.png', height: 20, width: 20),
            activeIcon: Image.asset(
              'images/wc_active.png',
              height: 20,
              width: 20,
            ),
            label: ('微信'),
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: ('通讯录'),
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: ('发现'),
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: ('我'),
          ),
        ],
      ),
    );
  }
}
