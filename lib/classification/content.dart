import 'package:flutter/material.dart';

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
];

final List<Map<String, dynamic>> itemData = itemList.asMap().entries.map((
  entry,
) {
  return {...entry.value, 'index': entry.key};
}).toList();

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
          ],
        ),
      ),
    );
  }
}
