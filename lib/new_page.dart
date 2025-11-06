import 'package:flutter/material.dart';

class NewPage extends StatelessWidget {
  const NewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = ModalRoute.of(context)?.settings;
    final arguments = settings?.arguments;
    final String receivedArgument = arguments as String? ?? '未收到参数';
    debugPrint(receivedArgument);

    return Scaffold(
      appBar: AppBar(title: Text('new route')),
      body: Center(
        child: Column(
          children: [
            Text('this is new route'),
            ElevatedButton(
              onPressed: () => Navigator.pop(context, "我是返回值"),
              child: Text("返回"),
            ),
          ],
        ),
      ),
    );
  }
}
