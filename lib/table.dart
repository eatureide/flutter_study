import 'package:flutter/material.dart';
import 'list.dart';
import 'tabs.dart';

// 列表输出
class MyTableCombine extends StatefulWidget {
  const MyTableCombine({super.key});

  @override
  State<MyTableCombine> createState() => _MyTableCombine();
}

class _MyTableCombine extends State<MyTableCombine> {
  @override
  build(BuildContext context) {
    return Column(children: [MyTabs(), MyList()]);
  }
}
