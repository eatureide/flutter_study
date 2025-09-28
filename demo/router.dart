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
      title: 'Flutter Route Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/detail': (context) {
          final args =
              ModalRoute.of(context)!.settings.arguments
                  as Map<String, dynamic>?;
          return DetailPage(args: args);
        },
      },
    );
  }
}

// 主页
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigator.of(context).push(
            //   MaterialPageRoute(
            //     builder: (BuildContext context) {
            //       return const DetailPage(message: "我是参数");
            //     },
            //   ),
            // );

            Navigator.pushNamed(
              context,
              '/detail',
              arguments: {'message': '我是命名路由传递的参数'},
            );

            // 重定向功能
            // Navigator.of(context).pushReplacementNamed("/detail");
          },
          child: Text('Go to Detail Page'),
        ),
      ),
    );
  }
}

// 详情页
class DetailPage extends StatelessWidget {
  final Map<String, dynamic>? args;
  const DetailPage({super.key, this.args});

  @override
  Widget build(BuildContext context) {
    // 直接从构造函数获取参数
    final String message = args?['message'] ?? 'No Message';
    return Scaffold(
      appBar: AppBar(title: Text('Detail Page')),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigator.pop(context);

                // Navigator.of(context).pushAndRemoveUntil(
                //   MaterialPageRoute(
                //     builder: (BuildContext context) {
                //       return const HomePage();
                //     },
                //   ),
                //   (route) => false,
                // );

              },
              child: Text('back to home page'),
            ),
            Text(message),
          ],
        ),
      ),
    );
  }
}
