import 'package:flutter/material.dart';
import 'banner_header.dart';
import 'menu.dart';
import 'coupon.dart';
import 'table.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  @override
  build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [BannerHeader(), Menu(), Coupon(), MyTableCombine()],
      ),
    );
  }
}
