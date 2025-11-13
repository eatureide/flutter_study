import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:developer' as developer;
import '../utils.dart';

List<int> numbers = List.generate(10, (index) => index);

class StackDemo extends StatefulWidget {
  const StackDemo({super.key});

  @override
  State<StackDemo> createState() => _StackDemo();
}

class _StackDemo extends State<StackDemo> {
  bool dialogVisible = false;
  TextEditingController userNameControler = TextEditingController();
  TextEditingController passwordControler = TextEditingController();

  switchVisible() {
    setState(() {
      dialogVisible = !dialogVisible;
      developer.log(userNameControler.text);
      developer.log(passwordControler.text);
    });
  }

  dialog() {
    var screenInfo = getScreenInfo(context);
    if (!dialogVisible) return [];
    return [
      Positioned(
        top: 0,
        left: 0,
        child: GestureDetector(
          onTap: switchVisible,
          child: Container(
            color: const Color.fromARGB(103, 0, 0, 0),
            width: screenInfo.screenWidth,
            height: screenInfo.screenHeight - screenInfo.appBarHeight,
            alignment: Alignment.center,
          ),
        ),
      ),
      Positioned(
        top: 200,
        left: 0,
        right: 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 360,
              height: 260,
              margin: EdgeInsets.only(bottom: 10),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  TextField(
                    controller: userNameControler,
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: "用户名",
                      hintText: "用户名或邮箱",
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                  TextField(
                    controller: passwordControler,
                    decoration: InputDecoration(
                      labelText: "密码",
                      hintText: "您的登录密码",
                      prefixIcon: Icon(Icons.lock),
                    ),
                    obscureText: true,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    color: Colors.transparent,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('login'),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(40),
              ),
              child: GestureDetector(
                onTap: switchVisible,
                child: Icon(CupertinoIcons.clear_thick, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    ];
  }

  flexItem() {
    return Container(
      color: Colors.white,
      width: 200,
      height: 200,
      child: Flex(
        direction: Axis.vertical,
        children: [
          Container(
            width: double.infinity,
            color: Colors.red,
            child: Text('11'),
          ),
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              color: Colors.blue,
              child: Text('333'),
            ),
          ),
        ],
      ),
    );
  }

  wrapComponent() {
    return Wrap(
      spacing: 8.0, // 主轴(水平)方向间距
      runSpacing: 4.0, // 纵轴（垂直）方向间距
      alignment: WrapAlignment.start, //沿主轴方向居中
      children: <Widget>[
        Chip(
          avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('A')),
          label: Text('Hamilton'),
        ),
        Chip(
          avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('M')),
          label: Text('Lafayette'),
        ),
        Chip(
          avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('H')),
          label: Text('Mulligan'),
        ),
        Chip(
          avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('J')),
          label: Text('Laurens'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var screenInfo = getScreenInfo(context);
    ScrollPhysics physics = dialogVisible
        ? NeverScrollableScrollPhysics()
        : AlwaysScrollableScrollPhysics();
    return Scaffold(
      appBar: AppBar(title: Text('StackDemo')),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: physics,
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: screenInfo.screenHeight - screenInfo.appBarHeight,
              color: const Color.fromARGB(144, 244, 67, 54),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ElevatedButton(
                    onPressed: switchVisible,
                    child: Text("DialogControl"),
                  ),
                  flexItem(),
                  wrapComponent(),
                ],
              ),
            ),
            ...dialog(),
          ],
        ),
      ),
    );
  }
}
