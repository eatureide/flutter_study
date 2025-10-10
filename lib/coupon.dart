import 'package:flutter/material.dart';

class Coupon extends StatefulWidget {
  const Coupon({super.key});

  @override
  State<Coupon> createState() => _Coupon();
}

class Item extends StatefulWidget {
  final String title;
  final String subTitle;
  final int index;

  const Item({
    super.key,
    required this.title,
    required this.subTitle,
    required this.index,
  });

  @override
  State<Item> createState() => _Item();
}

class _Item extends State<Item> {
  @override
  build(BuildContext context) {
    return Container(
      width: 150,
      height: 66,
      margin: EdgeInsets.only(right: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            margin: EdgeInsets.symmetric(horizontal: 6, vertical: 0),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 220, 220, 220),
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          Container(
            color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Color.fromARGB(255, 255, 123, 0)),
                ),
                Text(
                  widget.subTitle,
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Color.fromARGB(255, 255, 123, 0)),
                ),
              ],
            ),
          ),
        ],
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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        width: 500,
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Color.fromARGB(255, 255, 231, 201),
        ),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: itemData.asMap().entries.map((item) {
            int index = item.key;
            return Center(
              child: Padding(
                padding: EdgeInsetsGeometry.only(left: index == 0 ? 6 : 0),
                child: Item(
                  title: itemData[item.key]['title'],
                  subTitle: itemData[item.key]['subTitle'],
                  index: index,
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
