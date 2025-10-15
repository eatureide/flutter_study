import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Item extends StatefulWidget {
  final int? marginValue;
  const Item({super.key, this.marginValue});

  @override
  State<Item> createState() => _Item();
}

class _Item extends State<Item> {
  @override
  Widget build(BuildContext context) {
    int marginValue = widget.marginValue ?? 10;
    return Container(
      width: 120,
      height: 220,
      margin: EdgeInsets.only(right: marginValue.toDouble()),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        children: [
          Container(
            width: 140,
            height: 100,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 244, 231, 215),
              borderRadius: BorderRadiusDirectional.only(
                topStart: Radius.circular(6),
                topEnd: Radius.circular(6),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(4),
            width: double.infinity,
            color: Colors.transparent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 4),
                  color: Colors.transparent,
                  child: Text('福利芳丝净润洗面霜100克', style: TextStyle(fontSize: 12)),
                ),
                SizedBox(
                  height: 20,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 6),
                        padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
                        color: const Color.fromARGB(19, 255, 17, 0),
                        child: Text(
                          '会员价158元/件',
                          style: TextStyle(fontSize: 11, color: Colors.red),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
                        color: const Color.fromARGB(19, 255, 17, 0),
                        child: Text(
                          '会员价158元/件',
                          style: TextStyle(fontSize: 11, color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  color: Colors.transparent,
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '￥399',
                              style: TextStyle(
                                color: Color.fromARGB(255, 139, 139, 139),
                                fontSize: 10,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            Text('￥299'),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 85, 232, 207),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Icon(
                            CupertinoIcons.shopping_cart,
                            size: 12,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ItemGroup extends StatefulWidget {
  const ItemGroup({super.key});

  @override
  State<ItemGroup> createState() => _ItemGroup();
}

class _ItemGroup extends State<ItemGroup> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 24),
      padding: EdgeInsets.fromLTRB(10, 12, 10, 12),
      width: double.infinity,
      height: 360,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 220, 220, 220),
        borderRadius: BorderRadiusDirectional.circular(6),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Container(
              color: Colors.transparent,
              height: 220,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Item(),
                  Item(),
                  Item(),
                  Item(),
                  Item(),
                  Container(
                    width: 60,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 243, 243, 243),
                      borderRadius: BorderRadiusDirectional.circular(6),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text('查看'), Text('全部')],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
