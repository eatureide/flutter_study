import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/gestures.dart';

void main() {
  runApp(const MyApp());
}

final List<Map<String, dynamic>> carData = [
  {
    "picurl": "https://mall.flutterschool.cn/images/xhs/1.png",
    "title": "豪华轿车 - 车型A",
  },
  {
    "picurl": "https://mall.flutterschool.cn/images/xhs/1.png",
    "title": "城市SUV - 车型B",
  },
  {
    "picurl": "https://mall.flutterschool.cn/images/xhs/1.png",
    "title": "跑车 - 车型C",
  },
  {
    "picurl": "https://mall.flutterschool.cn/images/xhs/1.png",
    "title": "电动汽车 - 车型D",
  },
  {
    "picurl": "https://mall.flutterschool.cn/images/xhs/1.png",
    "title": "电动汽车 - 车型D",
  },
  {
    "picurl": "https://mall.flutterschool.cn/images/xhs/1.png",
    "title": "电动汽车 - 车型D",
  },
  {
    "picurl": "https://mall.flutterschool.cn/images/xhs/1.png",
    "title": "电动汽车 - 车型D",
  },
  {
    "picurl": "https://mall.flutterschool.cn/images/xhs/1.png",
    "title": "电动汽车 - 车型D",
  },
  {
    "picurl": "https://mall.flutterschool.cn/images/xhs/1.png",
    "title": "电动汽车 - 车型D",
  },
  {
    "picurl": "https://mall.flutterschool.cn/images/xhs/1.png",
    "title": "电动汽车 - 车型D",
  },
  {
    "picurl": "https://mall.flutterschool.cn/images/xhs/1.png",
    "title": "电动汽车 - 车型D",
  },
  {
    "picurl": "https://mall.flutterschool.cn/images/xhs/1.png",
    "title": "电动汽车 - 车型D",
  },
  {
    "picurl": "https://mall.flutterschool.cn/images/xhs/1.png",
    "title": "电动汽车 - 车型D",
  },
  {
    "picurl": "https://mall.flutterschool.cn/images/xhs/1.png",
    "title": "电动汽车 - 车型D",
  },
  {
    "picurl": "https://mall.flutterschool.cn/images/xhs/1.png",
    "title": "电动汽车 - 车型D",
  },
  {
    "picurl": "https://mall.flutterschool.cn/images/xhs/1.png",
    "title": "电动汽车 - 车型D",
  },
  {
    "picurl": "https://mall.flutterschool.cn/images/xhs/1.png",
    "title": "电动汽车 - 车型D",
  },
  {
    "picurl": "https://mall.flutterschool.cn/images/xhs/1.png",
    "title": "电动汽车 - 车型D",
  },
  {
    "picurl": "https://mall.flutterschool.cn/images/xhs/1.png",
    "title": "电动汽车 - 车型D",
  },
  {
    "picurl": "https://mall.flutterschool.cn/images/xhs/1.png",
    "title": "电动汽车 - 车型D",
  },
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Hello Flutter App')),
        body:
            // 为container添加背景色，圆角
            // Container(
            //   padding: EdgeInsets.all(10),
            //   margin: EdgeInsets.all(30),
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.all(Radius.circular(20)),
            //     color: Colors.red,
            //   ),
            //   child: Text('文字', style: TextStyle(fontSize: 26)),
            // ),
            // 为container添加边框
            // Container(
            //   padding: EdgeInsets.symmetric(horizontal: 10),
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(12),
            //     border: Border.all(color: Colors.blue, width: 2),
            //   ),
            //   child: const Text('文字1', style: TextStyle(fontSize: 26)),
            // ),
            // 为container添加圆角，背景图
            // Container(
            //   height: 200,
            //   width: 200,
            //   decoration: BoxDecoration(
            //     image: DecorationImage(
            //       image: AssetImage("images/flutter.png"),
            //       fit: BoxFit.contain,
            //     ),
            //     border: Border.all(color: Colors.blue, width: 2),
            //     shape: BoxShape.circle,
            //   ),
            // ),
            // Column(
            //   children: [
            //     //默认没有使用样式
            //     Text("Hello World"),
            //     // 文本居右不换行
            //     Text("Hello World" * 6, textAlign: TextAlign.right),
            //     // 文本不换行
            //     Text(
            //       "Hello World" * 10,
            //       textAlign: TextAlign.right,
            //       maxLines: 1,
            //     ),
            //     // 文本超出屏幕显示省略号
            //     Text(
            //       "Hello World" * 6,
            //       textAlign: TextAlign.right,
            //       overflow: TextOverflow.ellipsis,
            //     ),
            //     // 一些文本的基本样式
            //     Text(
            //       'hello world',
            //       style: TextStyle(
            //         color: Colors.red,
            //         fontSize: 20,
            //         fontWeight: FontWeight.bold,
            //         fontStyle: FontStyle.italic,
            //         letterSpacing: 5, // 字间距
            //         wordSpacing: 50, // 词间距
            //         decoration: TextDecoration.underline, // 下划线
            //         decorationStyle: TextDecorationStyle.dotted, // 下划线样式
            //       ),
            //     ),
            //     // TextSpan用于对同一段Text内容的不同片段进行不同的设置(样式、处理)
            //     Text.rich(
            //       TextSpan(
            //         text: "Please Select Item：",
            //         children: [
            //           TextSpan(
            //             text: "红",
            //             style: TextStyle(color: Colors.red),
            //             recognizer: TapGestureRecognizer()
            //               ..onTap = () {
            //                 Fluttertoast.showToast(msg: "你选择了红");
            //               },
            //           ),
            //           TextSpan(
            //             text: "蓝",
            //             style: TextStyle(color: Colors.blue),
            //             recognizer: TapGestureRecognizer()
            //               ..onTap = () {
            //                 Fluttertoast.showToast(msg: "你选择了蓝");
            //               },
            //           ),
            //         ],
            //       ),
            //     ),
            //     // 样式继承
            //     DefaultTextStyle(
            //       style: TextStyle(color: Colors.red, fontSize: 30),
            //       child: Column(
            //         children: [
            //           Text('hello world 1'),
            //           Text('hello world 2'),
            //           Text('hello world 3'),
            //           Text(
            //             'hello world 4',
            //             style: TextStyle(inherit: false, color: Colors.blue),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ],
            // ),
            // 图片
            // Column(
            //   children: [
            //     Image.asset('images/flutter.png', width: 100, height: 100),
            //     Image.network(
            //       "https://bkimg.cdn.bcebos.com/pic/203fb80e7bec54e7966cf33dbd389b504fc26a15",
            //     ),
            //     Container(
            //       width: 200,
            //       height: 200,
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(200),
            //         image: DecorationImage(
            //           image: NetworkImage(
            //             "https://bkimg.cdn.bcebos.com/pic/203fb80e7bec54e7966cf33dbd389b504fc26a15",
            //           ),
            //           fit: BoxFit.cover,
            //         ),
            //       ),
            //     ),
            //     ClipOval(
            //       child: ClipOval(
            //         child: Image.network(
            //           "https://bkimg.cdn.bcebos.com/pic/203fb80e7bec54e7966cf33dbd389b504fc26a15",
            //           width: 100,
            //           height: 100,
            //           fit: BoxFit.cover,
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            // 图标
            // Column(
            //   children: [
            //     Icon(Icons.search, color: Colors.red, size: 40),
            //     SizedBox(height: 10),
            //     Icon(Icons.home),
            //     Icon(Icons.category),
            //     SizedBox(height: 10),
            //     Icon(Icons.shop),
            //     SizedBox(height: 10),
            //   ],
            // ),
            // 垂直列表
            // ListView(
            //   children: [
            //     Image.network("https://mall.flutterschool.cn/images/xhs/1.png"),
            //     SizedBox(
            //       height: 50,
            //       child: Text(
            //         '我是一个Car',
            //         textAlign: TextAlign.center,
            //         style: TextStyle(fontSize: 20),
            //       ),
            //     ),
            //     Image.network("https://mall.flutterschool.cn/images/xhs/3.png"),
            //     SizedBox(
            //       height: 50,
            //       child: Text(
            //         '我是一个Car',
            //         textAlign: TextAlign.center,
            //         style: TextStyle(fontSize: 20),
            //       ),
            //     ),
            //     Image.network("https://mall.flutterschool.cn/images/xhs/4.png"),
            //     const SizedBox(
            //       height: 50,
            //       child: Text(
            //         "我是一个CAR",
            //         textAlign: TextAlign.center,
            //         style: TextStyle(fontSize: 20),
            //       ),
            //     ),
            //   ],
            // ),
            // 垂直图文列表
            // ListView(
            //   padding: const EdgeInsets.all(10),
            //   children: [
            //     ListTile(
            //       leading: Image.network(
            //         "https://mall.flutterschool.cn/images/xhs/1.png",
            //       ),
            //       title: const Text("这地方被通报批评，地铁狂飙时代落幕"),
            //     ),
            //     const Divider(),
            //     ListTile(
            //       leading: Image.network(
            //         "https://mall.flutterschool.cn/images/xhs/2.png",
            //       ),
            //       title: const Text("“中东土豪注资是假的”，高合汽车多手段逼员工辞职：调岗，拖欠补贴"),
            //     ),
            //     const Divider(),
            //     ListTile(
            //       leading: Image.network(
            //         "https://mall.flutterschool.cn/images/xhs/3.png",
            //       ),
            //       title: const Text("逼员工辞职：调岗，拖欠补贴"),
            //       subtitle: const Text("中东土豪注资是假的中东土豪注资是假的"),
            //     ),
            //     const Divider(),
            //     ListTile(
            //       title: const Text("逼员工辞职：调岗，拖欠补贴"),
            //       subtitle: const Text("中东土豪注资是假的中东土豪注资是假的"),
            //       trailing: Image.network(
            //         "https://mall.flutterschool.cn/images/xhs/4.png",
            //       ),
            //     ),
            //     const Divider(),
            //   ],
            // ),
            // 水平图文列表
            // SizedBox(
            //   height: 180,
            //   child: ListView(
            //     scrollDirection: Axis.horizontal,
            //     children: [
            //       Container(
            //         width: 120,
            //         decoration: const BoxDecoration(color: Colors.yellow),
            //         child: Column(
            //           children: [
            //             Container(
            //               height: 120,
            //               margin: const EdgeInsets.only(bottom: 6, right: 10),
            //               child: Image.network(
            //                 "https://mall.flutterschool.cn/images/xhs/1.png",
            //                 fit: BoxFit.cover,
            //               ),
            //             ),
            //             const Text("我是一个car"),
            //           ],
            //         ),
            //       ),
            //       Container(
            //         width: 120,
            //         decoration: const BoxDecoration(color: Colors.red),
            //         child: Column(
            //           children: [
            //             Container(
            //               height: 120,
            //               margin: const EdgeInsets.only(bottom: 6, right: 10),
            //               child: Image.network(
            //                 "https://mall.flutterschool.cn/images/xhs/2.png",
            //                 fit: BoxFit.cover,
            //               ),
            //             ),
            //             const Text("我是一个car"),
            //           ],
            //         ),
            //       ),
            //       Container(
            //         width: 120,
            //         decoration: const BoxDecoration(color: Colors.blue),
            //         child: Column(
            //           children: [
            //             Container(
            //               height: 120,
            //               margin: const EdgeInsets.only(bottom: 6, right: 10),
            //               child: Image.network(
            //                 "https://mall.flutterschool.cn/images/xhs/3.png",
            //                 fit: BoxFit.cover,
            //               ),
            //             ),
            //             const Text("我是一个car"),
            //           ],
            //         ),
            //       ),
            //       Container(
            //         width: 120,
            //         decoration: const BoxDecoration(color: Colors.green),
            //         child: Column(
            //           children: [
            //             Container(
            //               height: 120,
            //               margin: const EdgeInsets.only(bottom: 6, right: 10),
            //               child: Image.network(
            //                 "https://mall.flutterschool.cn/images/xhs/4.png",
            //                 fit: BoxFit.cover,
            //               ),
            //             ),
            //             const Text("我是一个car"),
            //           ],
            //         ),
            //       ),
            //       Container(
            //         width: 120,
            //         decoration: const BoxDecoration(color: Colors.yellow),
            //         child: Column(
            //           children: [
            //             Container(
            //               height: 120,
            //               margin: const EdgeInsets.only(bottom: 6, right: 10),
            //               child: Image.network(
            //                 "https://mall.flutterschool.cn/images/xhs/5.png",
            //                 fit: BoxFit.cover,
            //               ),
            //             ),
            //             const Text("我是一个car"),
            //           ],
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // 虚拟列表
            // ListView.builder(
            //   itemCount: carData.length,
            //   itemBuilder: (context, int index) {
            //     // print(index);
            //     return Column(
            //       children: [
            //         Image.network("${carData[index]["picurl"]}"),
            //         SizedBox(
            //           height: 50,
            //           child: Text(
            //             "$index ${carData[index]["title"]}",
            //             textAlign: TextAlign.center,
            //             style: const TextStyle(fontSize: 20),
            //           ),
            //         ),
            //       ],
            //     );
            //   },
            // ),
            Text('文字', style: TextStyle(fontSize: 26)),
      ),
    );
  }
}
