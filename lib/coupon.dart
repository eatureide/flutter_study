import 'package:flutter/material.dart';

class Coupon extends StatefulWidget {
  const Coupon({super.key});

  @override
  State<Coupon> createState() => _Coupon();
}

class Item extends StatefulWidget {
  final String title;
  final String subTitle;
  const Item({super.key, required this.title, required this.subTitle});

  @override
  State<Item> createState() => _Item();
}

class _Item extends State<Item> {
  @override
  build(BuildContext context) {
    return SizedBox(
      width: 180,
      height: 100,
      child: SizedBox(
        width: 150,
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 68,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            SizedBox(
              width: 100,
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(widget.title, textAlign: TextAlign.left),
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(widget.subTitle, textAlign: TextAlign.left),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final List<Map<String, dynamic>> itemData = const [
  {"title": "15", "subTitle": "满99元可用"},
  {"title": "15", "subTitle": "满99元可用"},
  {"title": "15", "subTitle": "满99元可用"},
  {"title": "15", "subTitle": "满99元可用"},
  {"title": "15", "subTitle": "满99元可用"},
  {"title": "15", "subTitle": "满99元可用"},
];

class _Coupon extends State<Coupon> {
  @override
  build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      color: Colors.grey,
      child: ListView(
        scrollDirection: Axis.horizontal, //水平方向
        children: itemData.map((item) {
          return Item(title: item['title'], subTitle: item['subTitle']);
        }).toList(),
      ),
    );
  }
}
