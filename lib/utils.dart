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
