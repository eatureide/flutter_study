import 'package:flutter/material.dart';

class BannerHeader extends StatefulWidget {
  const BannerHeader({super.key});

  @override
  State<BannerHeader> createState() => _BannerHeaderState();
}

class _BannerHeaderState extends State<BannerHeader> {
  final List<Map<String, dynamic>> bannerData = const [
    {"title": "第1页", "color": Colors.green},
    {"title": "第2页", "color": Colors.blue},
    {"title": "第3页", "color": Colors.pink},
  ];

  int _currentIndex = 0;

  @override
  build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          height: 350,
          child: PageView(
            onPageChanged: (int index) {
              setState(() {
                _currentIndex = index;
              });
            },
            children: bannerData.map((item) {
              return Container(
                color: item["color"] as Color,
                child: Center(
                  child: Text(
                    item["title"] as String,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              );
            }).toList(),
          ),
        ),

        Align(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: bannerData.asMap().entries.map((item) {
              return Container(
                width: 8,
                height: 8,
                margin: EdgeInsets.fromLTRB(3, 0, 3, 6),
                decoration: BoxDecoration(
                  color: item.key == _currentIndex
                      ? Colors.yellow
                      : Colors.black,
                  borderRadius: BorderRadius.circular(20),
                ),
              );
            }).toList(),
          ),
        ),

        Positioned(
          left: 6,
          top: 35,
          child: Container(
            width: 50,
            height: 50,

            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),

        Positioned(
          left: 0,
          right: -50,
          top: 35,
          child: Center(
            child: SizedBox(
              width: 330,
              child: TextField(
                style: TextStyle(fontSize: 12),
                decoration: InputDecoration(
                  hintText: '搜索商品',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                onChanged: (value) {
                  print('当前输入: $value');
                },
                onSubmitted: (value) {
                  print('提交的内容: $value');
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
