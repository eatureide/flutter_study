import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

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
