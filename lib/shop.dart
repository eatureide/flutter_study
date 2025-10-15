import 'package:flutter/material.dart';
import 'search.dart';
import 'welcome.dart';
import 'group.dart';
import 'item_group.dart';

class Shop extends StatefulWidget {
  const Shop({super.key});

  @override
  State<Shop> createState() => _Shop();
}

class _Shop extends State<Shop> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
      color: Color.fromARGB(255, 239, 245, 247),
      width: double.infinity,
      height: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Search(),
            Welcome(),
            Group(),
            ItemGroup(),
            ItemGroup()
          ],
        ),
      ),
    );
  }
}
