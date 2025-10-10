import 'package:flutter/material.dart';

class BannerHeader extends StatefulWidget {
  const BannerHeader({super.key});

  @override
  State<BannerHeader> createState() => _BannerHeaderState();
}

class _BannerHeaderState extends State<BannerHeader> {
  final List<Map<String, dynamic>> bannerData = const [
    {"title": "第1页", "color": Color.fromARGB(255, 255, 176, 221)},
    {"title": "第2页", "color": Color.fromARGB(255, 239, 206, 162)},
    {"title": "第3页", "color": Color.fromARGB(255, 79, 186, 227)},
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
                width: 16,
                height: 2,
                margin: EdgeInsets.fromLTRB(0, 0, 0, 6),
                decoration: BoxDecoration(
                  color: item.key == _currentIndex
                      ? Color.fromARGB(200, 0, 0, 0)
                      : Color.fromARGB(100, 255, 255, 255),
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
