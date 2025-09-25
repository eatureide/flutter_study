import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/gestures.dart';

void main() {
  runApp(const MyApp());
}

final List<Map<String, dynamic>> list = [
  {
    "cover":
        "https://bkimg.cdn.bcebos.com/pic/203fb80e7bec54e7966cf33dbd389b504fc26a15",
    "name": "手機",
  },
  {
    "cover":
        "https://bkimg.cdn.bcebos.com/pic/203fb80e7bec54e7966cf33dbd389b504fc26a15",
    "name": "電腦",
  },
  {
    "cover":
        "https://bkimg.cdn.bcebos.com/pic/203fb80e7bec54e7966cf33dbd389b504fc26a15",
    "name": "耳機",
  },
  {
    "cover":
        "https://bkimg.cdn.bcebos.com/pic/203fb80e7bec54e7966cf33dbd389b504fc26a15",
    "name": "鍵盤",
  },
  {
    "cover":
        "https://bkimg.cdn.bcebos.com/pic/203fb80e7bec54e7966cf33dbd389b504fc26a15",
    "name": "滑鼠",
  },
  {
    "cover":
        "https://bkimg.cdn.bcebos.com/pic/203fb80e7bec54e7966cf33dbd389b504fc26a15",
    "name": "相機",
  },
  {
    "cover":
        "https://bkimg.cdn.bcebos.com/pic/203fb80e7bec54e7966cf33dbd389b504fc26a15",
    "name": "電視",
  },
  {
    "cover":
        "https://bkimg.cdn.bcebos.com/pic/203fb80e7bec54e7966cf33dbd389b504fc26a15",
    "name": "平板",
  },
  {
    "cover":
        "https://bkimg.cdn.bcebos.com/pic/203fb80e7bec54e7966cf33dbd389b504fc26a15",
    "name": "智能手錶",
  },
];

class GridViewTest extends StatelessWidget {
  const GridViewTest({super.key});

  List<Widget> _initlistdata() {
    List<Widget> tmplist = []; //创建一个存储widget的列表
    for (var i = 0; i < list.length; i++) {
      //list为接收到的数据,在头文件引入
      tmplist.add(
        Container(
          alignment: Alignment.bottomRight,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.red, width: 2), //设置边框
          ),
          child: Column(
            children: [
              Image(
                image: NetworkImage("${list[i]["cover"]}"),
                fit: BoxFit.cover,
                width: 100,
                height: 100,
              ),
              const SizedBox(height: 10),
              Text("${list[i]["name"]}"), //设置文字
            ],
          ),
        ),
      );
    }
    return tmplist;
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3, //设置一行的个数
      crossAxisSpacing: 10, //设置列间距
      mainAxisSpacing: 10, //设置行间距
      children: _initlistdata(),
    );
  }
}

class GridViewTestA extends StatelessWidget {
  const GridViewTestA({super.key});

  Widget _initlistdata(context, index) {
    return Container(
      alignment: Alignment.bottomRight,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.red, width: 2),
      ),
      child: Column(
        children: [
          Image(image: NetworkImage("${list[index]["cover"]}")), //设置显示图片
          const SizedBox(height: 10),
          Text("${list[index]["name"]}"), //设置文字
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: list.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: _initlistdata,
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Hello Flutter App')),
        body: GridViewTestA(),
      ),
    );
  }
}
