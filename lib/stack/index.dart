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

  @override
  Widget build(BuildContext context) {
    var screenInfo = getScreenInfo(context);
    return Scaffold(
      appBar: AppBar(title: Text('StackDemo')),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: dialogVisible
            ? NeverScrollableScrollPhysics()
            : AlwaysScrollableScrollPhysics(),
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
