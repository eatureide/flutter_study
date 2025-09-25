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

        // body: Row(
        //   children: [
        //     const Expanded(
        //       flex: 1,
        //       child: Text(
        //         "深秋冬装搭配一整套韩剧小香学院风富家千金感穿搭套装连衣裙子女深秋冬装搭配一整套韩剧小香学院风富家千金感穿搭套装连衣裙子女",
        //         style: TextStyle(fontSize: 16),
        //       ),
        //     ),
        //     Container(
        //       width: 60,
        //       height: 60,
        //       alignment: Alignment.center,
        //       decoration: BoxDecoration(
        //         color: Colors.blue,
        //         borderRadius: BorderRadius.circular(10),
        //       ),
        //       child: const Text(
        //         '订购',
        //         style: TextStyle(fontSize: 20, color: Colors.white),
        //       ),
        //     ),
        //   ],
        // ),
        // body: ListView(
        //   padding: const EdgeInsets.all(10),
        //   children: [
        //     Container(
        //       margin: const EdgeInsets.only(bottom: 10),
        //       height: 200,
        //       child: Image.network(
        //         "https://www.flutterschool.cn/images/xhs/1.png",
        //         fit: BoxFit.cover,
        //       ),
        //     ),
        //     Row(
        //       children: [
        //         Expanded(
        //           flex: 2,
        //           child: SizedBox(
        //             height: 210,
        //             child: Image.network(
        //               "https://www.flutterschool.cn/images/xhs/2.png",
        //               fit: BoxFit.cover,
        //             ),
        //           ),
        //         ),
        //         Expanded(
        //           flex: 1,
        //           child: SizedBox(
        //             height: 210,
        //             child: Column(
        //               children: [
        //                 Container(
        //                   margin: const EdgeInsets.only(left: 10, bottom: 10),
        //                   height: 100,
        //                   child: Image.network(
        //                     "https://www.flutterschool.cn/images/xhs/3.png",
        //                     fit: BoxFit.cover,
        //                   ),
        //                 ),
        //                 Container(
        //                   margin: const EdgeInsets.only(left: 10),
        //                   height: 100,
        //                   child: Image.network(
        //                     "https://www.flutterschool.cn/images/xhs/4.png",
        //                     fit: BoxFit.cover,
        //                   ),
        //                 ),
        //               ],
        //             ),
        //           ),
        //         ),
        //       ],
        //     ),
        //   ],
        // ),
        // body: Stack(
        //   alignment: AlignmentDirectional(-0.5, 0.5),
        //   fit: StackFit.loose,
        //   textDirection: TextDirection.rtl,
        //   children: [
        //     Container(height: 100, width: 100, color: Colors.red),
        //     Text("我是文本"),
        //     Text("222222222"),
        //   ],
        // ),
        // align
        // body: Container(
        //   height: 400,
        //   width: 400,
        //   color: Colors.red,
        //   child: Stack(
        //     children: [
        //       Align(
        //         alignment: Alignment.center,
        //         child: Icon(
        //           Icons.account_circle,
        //           size: 40,
        //           color: const Color.fromARGB(255, 4, 1, 1),
        //         ),
        //       ),
        //       Align(
        //         alignment: Alignment.topLeft,
        //         child: Icon(
        //           Icons.cached_outlined,
        //           size: 40,
        //           color: Colors.white,
        //         ),
        //       ),
        //       Align(
        //         alignment: Alignment.bottomRight,
        //         child: Icon(
        //           Icons.baby_changing_station,
        //           size: 40,
        //           color: Colors.white,
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        // Positioned
        // body: Container(
        //   height: 400,
        //   width: 400,
        //   color: Colors.red,
        //   child: Stack(
        //     children: [
        //       Positioned(
        //         left: 10,
        //         top: 10,
        //         width: 60,
        //         height: 60,
        //         child: Container(color: Colors.black),
        //       ),
        //       Positioned(
        //         right: 10,
        //         top: 10,
        //         width: 60,
        //         height: 60,
        //         child: Container(color: Colors.blue),
        //       ),
        //       Positioned(
        //         left: 10,
        //         bottom: 10,
        //         width: 40,
        //         height: 40,
        //         child: Container(color: Colors.yellow),
        //       ),
        //       Positioned(
        //         bottom: 10,
        //         right: 10,
        //         width: 40,
        //         height: 40,
        //         child: Container(color: Colors.deepPurple),
        //       ),
        //     ],
        //   ),
        // ),
        body: Wrap(
          children: [
            MyButton(text: "《封神第一部》", pressed: () {}),
            MyButton(text: "变形金刚", pressed: () {}),
            MyButton(text: "暗杀风暴", pressed: () {}),
            MyButton(text: "消失的她", pressed: () {}),
            MyButton(text: "零号追杀", pressed: () {}),
            MyButton(text: "长安三万里", pressed: () {}),
            MyButton(text: "老板娘3", pressed: () {}),
            MyButton(text: "穷兄富弟", pressed: () {}),
            MyButton(text: "暗杀风暴", pressed: () {}),
            MyButton(text: "黄河守墓人", pressed: () {}),
            MyButton(text: "上海滩之风云正道", pressed: () {}),
            MyButton(text: "惊天侠盗团", pressed: () {}),
          ],
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final String text;
  final Function() pressed;
  const MyButton({super.key, required this.text, required this.pressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        elevation: WidgetStateProperty.all(0),
        backgroundColor: WidgetStateProperty.all(Colors.blue),
        foregroundColor: WidgetStateProperty.all(Colors.white),
      ),
      onPressed: pressed,
      child: Text(text),
    );
  }
}
