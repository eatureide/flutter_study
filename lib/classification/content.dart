import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Content extends StatefulWidget {
  const Content({super.key});

  @override
  State<Content> createState() => _Content();
}

final List<Map<String, dynamic>> itemList = const [
  {"title": "肌肤护理"},
  {"title": "彩妆"},
  {"title": "个人护理"},
  {"title": "底妆"},
  {"title": "母婴生活"},
  {"title": "营养保健"},
  {"title": "护理护具"},
  {"title": "常见药品"},
  {"title": "隐形研究"},
  {"title": "香水香氛"},
  {"title": "护理护具"},
  {"title": "常见药品"},
  {"title": "隐形研究"},
  {"title": "香水香氛"},
];

final List<Map<String, dynamic>> itemData = itemList.asMap().entries.map((
  entry,
) {
  return {...entry.value, 'index': entry.key};
}).toList();

final List<Map<String, dynamic>> goodList = const [
  {"title": "娇韵诗双萃精华清爽版小样装0.9ml", "price": "19.00", "origin": "39.00"},
  {"title": "珊珂洗颜专科超微米颜洁乳120克", "price": "19.00", "origin": "39.00"},
  {"title": "伊丽莎白", "price": "19.00", "origin": "39.00"},
  {"title": "雅诗兰黛10.9ml", "price": "19.00", "origin": "39.00"},
  {"title": "洗面奶0.9ml", "price": "19.00", "origin": "39.00"},
  {"title": "SENKA清洁痘洁面膏", "price": "19.00", "origin": "39.00"},
  {"title": "欧莱雅10ml", "price": "19.00", "origin": "39.00"},
];

class _Content extends State<Content> {
  int currentIndex = 0;

  handleTabRowClick(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(top: 20),
        color: Colors.white,
        child: Row(
          children: [
            Container(
              color: Color.fromARGB(255, 247, 247, 247),
              width: 100,
              child: ListView(
                padding: EdgeInsets.all(0),
                scrollDirection: Axis.vertical,
                children: itemData.map((item) {
                  return GestureDetector(
                    onTap: () {
                      handleTabRowClick(item['index']);
                    },
                    child: Container(
                      width: double.infinity,
                      color: currentIndex == item['index']
                          ? Colors.white
                          : Colors.transparent,
                      height: 50,
                      child: Row(
                        children: [
                          Container(
                            width: 4,
                            height: 26,
                            color: currentIndex == item['index']
                                ? Color.fromARGB(255, 47, 238, 236)
                                : Colors.white,
                            margin: EdgeInsets.only(right: 10),
                          ),
                          Text(item['title']),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.all(0),
                children: goodList.map((item) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 90,
                        height: 90,
                        margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 220, 220, 220),
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      Container(
                        width: 190,
                        height: 90,
                        margin: EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                                children: [
                                  WidgetSpan(
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 2,
                                        vertical: 1,
                                      ),
                                      margin: EdgeInsets.only(right: 5),
                                      decoration: BoxDecoration(
                                        color: Color.fromARGB(
                                          255,
                                          148,
                                          97,
                                          242,
                                        ),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Text(
                                        '保税仓库直发',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ),
                                  TextSpan(
                                    text: item['title'],
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  color: const Color.fromARGB(14, 244, 67, 54),
                                  child: Text(
                                    '153元/2件',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ),
                                Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.baseline,
                                      textBaseline: TextBaseline.alphabetic,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          '¥',
                                          style: TextStyle(fontSize: 10),
                                        ),
                                        Text(
                                          '${item['price']} ',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        Text(
                                          item['origin'],
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12,
                                            decoration:
                                                TextDecoration.lineThrough,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: 5,
                                      child: Container(
                                        width: 22,
                                        height: 22,
                                        decoration: BoxDecoration(
                                          color: Color.fromARGB(
                                            255,
                                            85,
                                            232,
                                            207,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            22,
                                          ),
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
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
