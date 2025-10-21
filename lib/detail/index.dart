import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';

final List<Map<String, dynamic>> bannerData = const [
  {"title": "第1页", "color": Color.fromARGB(255, 142, 213, 193)},
  {"title": "第2页", "color": Color.fromARGB(255, 249, 194, 122)},
  {"title": "第3页", "color": Color.fromARGB(255, 120, 179, 243)},
];

final List<Map<String, dynamic>> tagList = const [
  {"name": "水感净颜不拔干"},
  {"name": "舒缓修护强韧肌肤"},
  {"name": "温和洁净无负担"},
];

final List<Map<String, dynamic>> bannerDataExtend = bannerData
    .asMap()
    .entries
    .map((entry) {
      int idx = entry.key;
      Map<String, dynamic> item = entry.value;
      return {...item, "index": idx};
    })
    .toList();

class Detail extends StatefulWidget {
  const Detail({super.key});

  @override
  State<Detail> createState() => _Detail();
}

class _Detail extends State<Detail> {
  late PageController _pageController;
  late Timer _timer;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
    _startTimer();
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
    _pageController.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (!_pageController.hasClients) return;
      _currentIndex = _currentIndex + 1;
      if (_currentIndex >= bannerDataExtend.length) _currentIndex = 0;
      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final screenSize = mediaQueryData.size;
    final screenWidth = screenSize.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // 顶部banner
            Container(
              width: double.infinity,
              height: 400,
              color: Colors.transparent,
              child: Stack(
                children: [
                  PageView(
                    controller: _pageController,
                    onPageChanged: (index) {
                      _timer.cancel();
                      _startTimer();
                      _currentIndex = index;
                    },
                    children: bannerDataExtend.map((item) {
                      return Stack(
                        children: [
                          Container(color: item['color'] as Color),
                          Positioned(
                            bottom: 26,
                            right: 12,
                            child: Container(
                              padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(140, 0, 0, 0),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                "${item['index'] + 1}/${bannerDataExtend.length}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Container(
                      height: 10,
                      width: screenWidth,

                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 244, 244, 244),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // 正文内容
            Container(
              height: 600,
              color: Color.fromARGB(255, 244, 244, 244),
              padding: EdgeInsets.fromLTRB(10, 6, 10, 10),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(16),
                    margin: EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text('￥', style: TextStyle(fontSize: 14)),
                            Text('85', style: TextStyle(fontSize: 28)),
                            Text('.00', style: TextStyle(fontSize: 14)),
                            Container(
                              padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
                              margin: EdgeInsets.fromLTRB(4, 0, 4, 0),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 253, 238, 202),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                '会员价',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 65, 42, 4),
                                ),
                              ),
                            ),
                            Text(
                              '非会员价￥125.00',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              color: Color.fromARGB(25, 249, 125, 125),
                              padding: EdgeInsets.fromLTRB(4, 2, 4, 2),
                              child: Text(
                                '会员3件（及以上）9折',
                                style: TextStyle(
                                  color: const Color.fromARGB(255, 241, 16, 0),
                                ),
                              ),
                            ),
                            Icon(CupertinoIcons.right_chevron, size: 16),
                          ],
                        ),
                        Container(
                          color: Colors.transparent,
                          margin: EdgeInsets.fromLTRB(0, 6, 0, 10),
                          child: Text(
                            '适乐肤舒缓净颜泡沫洁面凝胶236ml',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        Row(
                          children: tagList.map((item) {
                            return Container(
                              margin: EdgeInsets.only(right: 4),
                              padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(3),
                                border: Border.all(
                                  color: Color.fromARGB(153, 177, 110, 2),
                                ),
                              ),
                              child: Text(
                                item['name'],
                                style: TextStyle(
                                  color: Color.fromARGB(255, 177, 110, 2),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Column(
                      children: [
                        Container(
                          color: Colors.transparent,
                          margin: EdgeInsets.only(bottom: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                color: Colors.transparent,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(right: 10),
                                      child: Text(
                                        '已选',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                    Text('适乐肌肤舒缓净颜泡沫洁面凝胶236ml'),
                                  ],
                                ),
                              ),
                              Icon(CupertinoIcons.right_chevron, size: 16),
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.transparent,
                          margin: EdgeInsets.only(bottom: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                color: Colors.transparent,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(right: 10),
                                      child: Text(
                                        '配送',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                    Text('至 广东省广州市天河区东方路160号'),
                                  ],
                                ),
                              ),
                              Icon(CupertinoIcons.right_chevron, size: 16),
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.transparent,
                          margin: EdgeInsets.only(bottom: 12),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: Text(
                                  '配送',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 3),
                                child: Text(
                                  '闪电送',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                              Text('门店接单后，快至30分钟内送达'),
                              Padding(
                                padding: EdgeInsets.only(left: 4),
                                child: Icon(
                                  CupertinoIcons.question_circle,
                                  size: 18,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.transparent,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                color: Colors.transparent,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(right: 10),
                                      child: Text(
                                        '服务',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                    Text('正品保证 · 快至30分钟送达 · 满98元包邮'),
                                  ],
                                ),
                              ),
                              Icon(CupertinoIcons.right_chevron, size: 16),
                            ],
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
      ),
    );
  }
}
