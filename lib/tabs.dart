import 'package:flutter/material.dart';

final List<Map<String, dynamic>> tableData = const [
  {"title": "猜你喜欢", "subTitle": "为你推荐"},
  {"title": "猜你喜欢", "subTitle": "为你推荐"},
  {"title": "猜你喜欢", "subTitle": "为你推荐"},
  {"title": "猜你喜欢", "subTitle": "为你推荐"},
  {"title": "猜你喜欢", "subTitle": "为你推荐"},
  {"title": "猜你喜欢", "subTitle": "为你推荐"},
];

class MyTabs extends StatefulWidget {
  const MyTabs({super.key});

  @override
  State<MyTabs> createState() => _MyTabs();
}

class _MyTabs extends State<MyTabs> {
  int _currentIndex = 0;

  handleTabClick(index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: double.infinity,
      height: 80,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: tableData.asMap().entries.map((item) {
          return Container(
            color: Colors.transparent,
            margin: EdgeInsets.all(16),
            child: GestureDetector(
              onTap: () {
                handleTabClick(item.key);
              },
              child: Column(
                children: [
                  Text(
                    tableData[item.key]['title'],
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: _currentIndex == item.key
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    decoration: BoxDecoration(
                      color: _currentIndex == item.key
                          ? Color.fromARGB(255, 104, 242, 207)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      tableData[item.key]['subTitle'],
                      style: TextStyle(
                        color: _currentIndex == item.key
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
