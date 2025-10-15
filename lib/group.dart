import 'package:flutter/material.dart';

class Item extends StatefulWidget {
  final String title;
  final String subTitle;

  const Item({super.key, required this.title, required this.subTitle});

  @override
  State<Item> createState() => _Item();
}

class _Item extends State<Item> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 116,
      height: 100,
      margin: EdgeInsets.only(top: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadiusGeometry.circular(6)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 220, 220, 220),
              borderRadius: BorderRadiusDirectional.only(
                topStart: Radius.circular(6),
                topEnd: Radius.circular(6),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            // height: 50,
            color: Colors.transparent,
            margin: EdgeInsetsDirectional.only(bottom: 5),
            child: Column(
              children: [
                Text(
                  widget.title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                Text(
                  '— ${widget.subTitle} —',
                  style: TextStyle(fontSize: 8, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Group extends StatefulWidget {
  const Group({super.key});

  @override
  State<Group> createState() => _Group();
}

class _Group extends State<Group> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Item(title: '会员特权', subTitle: '立享好物会员价'),
        Item(title: '新奇事务所', subTitle: '超值好物会员优先试'),
        Item(title: '门店服务', subTitle: '定制彩妆面部SPA服务'),
      ],
    );
  }
}
