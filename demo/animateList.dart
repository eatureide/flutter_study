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
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State createState() => _HomePageState();
}

class _HomePageState extends State {
  final globalKey = GlobalKey<AnimatedListState>();
  List list = ["第一条数据", "第二条数据"];
  @override
  void initState() {
    super.initState();
  }

  void _removeItem(int index) {
    final removedItem = list[index]; // 保存被移除的项
    list.removeAt(index); // 从列表中移除
    globalKey.currentState!.removeItem(
      index,
      (context, animation) => FadeTransition(
        opacity: animation,
        child: ListTile(
          title: Text(removedItem),
          trailing: const Icon(Icons.delete),
        ),
      ),
      duration: const Duration(milliseconds: 300), // 删除动画时长
    );
    // 可选：显示删除提示
    Fluttertoast.showToast(msg: "已删除: $removedItem");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          list.add("这是1个数据");
          globalKey.currentState!.insertItem(list.length - 1);
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(title: const Text("AppBar组件")),
      body: AnimatedList(
        key: globalKey,
        initialItemCount: list.length,
        itemBuilder: (context, index, animation) {
          return FadeTransition(
            opacity: animation,
            child: ListTile(
              title: Text(list[index]),
              trailing: GestureDetector(
                onTap: () => _removeItem(index),
                child: const Icon(Icons.delete),
              ),
            ),
          );
        },
      ),
    );
  }
}
