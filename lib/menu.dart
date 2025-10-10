import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _Menu();
}

class _Menu extends State<Menu> {
  final List<Map<String, dynamic>> menuData = const [
    {"title": "成员"},
    {"title": "成员"},
    {"title": "成员"},
    {"title": "成员"},
    {"title": "成员"},
    {"title": "成员"},
    {"title": "成员"},
    {"title": "成员"},
    {"title": "成员"},
    {"title": "成员"},
  ];

  @override
  build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: GridView.count(
        // padding: EdgeInsets.zero,
        crossAxisCount: 5, // 设置一行的个数
        crossAxisSpacing: 10, // 设置列间距
        mainAxisSpacing: 10, // 设置行间距
        children: menuData.map((item) {
          return Container(
            alignment: Alignment.bottomCenter,
            width: 50,
            height: 50,
            child: Column(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 220, 220, 220),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                Text(item['title']),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
