import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'dart:developer';
import 'dart:convert';
import 'package:dio/dio.dart';

// 最好定义为全局或静态 final 变量
final logger = Logger(
  printer: PrettyPrinter(
    methodCount: 2, // 显示 2 行调用堆栈
    errorMethodCount: 8, // 错误时显示 8 行
    lineLength: 120, // 打印内容的最大长度
    colors: true, // 启用颜色
    printEmojis: true, // 启用表情符号
  ),
);

bool toastFinish = true;
showToast(String msg) {
  if (!toastFinish) return;
  Future.delayed(Duration(microseconds: 500), () {
    toastFinish = false;
  });
  toastFinish = true;
  Fluttertoast.showToast(
    gravity: ToastGravity.CENTER,
    msg: msg,
    backgroundColor: Colors.black54,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

class ScreenInfo {
  double screenWidth;
  double screenHeight;
  double appBarHeight;

  ScreenInfo({
    required this.screenWidth,
    required this.screenHeight,
    required this.appBarHeight,
  });
}

ScreenInfo getScreenInfo(BuildContext context) {
  final mediaQueryData = MediaQuery.of(context);
  final double screenWidth = mediaQueryData.size.width;
  final double screenHeight = mediaQueryData.size.height;

  final double statusBarHeight = MediaQuery.of(context).padding.top;
  const double appBarToolbarHeight = kToolbarHeight;
  final double totalTopHeight = statusBarHeight + appBarToolbarHeight;

  return ScreenInfo(
    screenHeight: screenHeight,
    screenWidth: screenWidth,
    appBarHeight: totalTopHeight,
  );
}

void console(dynamic data) {
  try {
    if (data is Map || data is List) {
      const JsonEncoder encoder = JsonEncoder.withIndent('  ');
      String prettyData = encoder.convert(data);
      log(prettyData);
    } else {
      log(data.toString());
    }
  } catch (e) {
    log('Error logging response body: $e');
  }
}
