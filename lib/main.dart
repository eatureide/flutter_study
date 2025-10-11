import 'package:flutter/material.dart';
import 'banner_header.dart';
import 'menu.dart';
import 'coupon.dart';
import 'table.dart';
import 'nav.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Nav(),
      body: SingleChildScrollView(
        child: Column(
          children: [BannerHeader(), Menu(), Coupon(), MyTableCombine()],
        ),
      ),
    );
  }
}
