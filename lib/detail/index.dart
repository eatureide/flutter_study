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

List<int> numbersList = List.generate(10, (index) => index);

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
  final ScrollController _scrollController = ScrollController();
  int _currentIndex = 0;
  double topButtonVisible = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
    _startTimer();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
    _pageController.dispose();
    _scrollController.dispose();
  }

  void _scrollListener() {
    bool needShow =
        _scrollController.offset >=
        _scrollController.position.maxScrollExtent - 500;

    setState(() {
      topButtonVisible = needShow ? 1.0 : 0;
    });
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 6), (timer) {
      if (!_pageController.hasClients) return;
      _currentIndex = _currentIndex + 1;
      if (_currentIndex >= bannerDataExtend.length) _currentIndex = 0;
      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOut,
      );
    });
  }

  double screenWidth() {
    final mediaQueryData = MediaQuery.of(context);
    final screenSize = mediaQueryData.size;
    final screenWidth = screenSize.width;
    return screenWidth;
  }

  bannerComponent() {
    return Container(
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
              width: screenWidth(),

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
    );
  }

  itemInformation() {
    return Container(
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
                style: TextStyle(fontSize: 14, color: Colors.grey),
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
            child: Text('适乐肤舒缓净颜泡沫洁面凝胶236ml', style: TextStyle(fontSize: 18)),
          ),
          Row(
            children: tagList.map((item) {
              return Container(
                margin: EdgeInsets.only(right: 4),
                padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(3),
                  border: Border.all(color: Color.fromARGB(153, 177, 110, 2)),
                ),
                child: Text(
                  item['name'],
                  style: TextStyle(
                    color: Color.fromARGB(255, 177, 110, 2),
                    fontSize: 12,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  locationService() {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
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
                        child: Text('已选', style: TextStyle(color: Colors.grey)),
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
            margin: EdgeInsets.only(bottom: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  color: Colors.transparent,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Text('配送', style: TextStyle(color: Colors.grey)),
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Text('配送', style: TextStyle(color: Colors.white)),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 3),
                  child: Text('闪电送', style: TextStyle(color: Colors.red)),
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
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  color: Colors.transparent,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Text('服务', style: TextStyle(color: Colors.grey)),
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
    );
  }

  comment() {
    return Container(
      height: 160,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  color: Colors.transparent,
                  child: Row(
                    children: [
                      Text('种草口碑', style: TextStyle(fontSize: 16)),
                      Text(
                        ' (707)',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('查看更多', style: TextStyle(fontSize: 14)),
                    Icon(
                      CupertinoIcons.chevron_right,
                      size: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: numbersList.map((item) {
                return Container(
                  margin: EdgeInsets.only(
                    right: item == numbersList.length - 1 ? 0 : 12,
                  ),
                  width: 260,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      color: const Color.fromARGB(73, 158, 158, 158),
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 100,
                        margin: EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: const Color.fromARGB(166, 158, 158, 158),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              bottom: 6,
                              left: 6,
                              child: Container(
                                height: 16,
                                padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
                                color: const Color.fromARGB(181, 0, 0, 0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(right: 4),
                                      child: Icon(
                                        CupertinoIcons.eye_fill,
                                        color: Colors.white,
                                        size: 12,
                                      ),
                                    ),
                                    Text(
                                      '7000',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: 2),
                                  child: Icon(
                                    CupertinoIcons.profile_circled,
                                    size: 16,
                                  ),
                                ),
                                Text(
                                  'User',
                                  style: TextStyle(
                                    color: const Color.fromARGB(
                                      255,
                                      97,
                                      97,
                                      97,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 8),
                              child: Text(
                                '非常好用的一款洁面产品，洗完脸很清爽不紧绷，推荐购买！非常好用的一款洁面产品，洗完脸很清爽不紧绷，推荐购买！',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  buttonToor() {
    return Container(
      padding: EdgeInsets.fromLTRB(14, 22, 14, 10),
      width: double.infinity,
      height: 100,
      color: Colors.white,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.only(top: 2),
                  height: 50,
                  color: Colors.transparent,
                  child: Column(
                    children: [
                      Icon(CupertinoIcons.shopping_cart),
                      Text('购物车', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 2),
                height: 50,
                color: Colors.transparent,
                child: Column(
                  children: [
                    Icon(CupertinoIcons.chat_bubble_2),
                    Text('咨询', style: TextStyle(fontSize: 12)),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 2),
                height: 50,
                color: Colors.transparent,
                child: Column(
                  children: [
                    Icon(CupertinoIcons.heart),
                    Text('收藏', style: TextStyle(fontSize: 12)),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                    color: const Color.fromARGB(142, 0, 0, 0),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(45),
                ),
                width: 120,
                height: 45,
                child: Center(child: Text('立即购买')),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(45),
                  color: Color.fromARGB(255, 101, 239, 208),
                ),
                width: 120,
                height: 45,
                child: Center(
                  child: Text('加入购物车', style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  floatingActionButton() {
    handleTap() {
      _scrollController.animateTo(
        0.0,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
      );
    }

    final List<BoxShadow> boxShadow = [
      BoxShadow(
        color: Color.fromARGB(61, 158, 158, 158),
        offset: Offset(4, 4),
        blurRadius: 8.0,
        spreadRadius: 0.0,
      ),
    ];

    final Decoration boxDecoration = BoxDecoration(
      boxShadow: boxShadow,
      color: Color.fromARGB(172, 255, 255, 255),
      borderRadius: BorderRadius.circular(50),
    );

    return Container(
      width: 50,
      height: 110,
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: boxDecoration,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(CupertinoIcons.share, size: 18),
                Text('分享', style: TextStyle(fontSize: 10)),
              ],
            ),
          ),
          GestureDetector(
            onTap: handleTap,
            child: AnimatedOpacity(
              opacity: topButtonVisible,
              duration: Duration(milliseconds: 100),
              child: Container(
                width: 50,
                height: 50,
                decoration: boxDecoration,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(CupertinoIcons.chevron_up, size: 18),
                    Text('顶部', style: TextStyle(fontSize: 10)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  recommend() {
    return Container(
      margin: EdgeInsets.only(top: 12),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [Text('看过的人也喜欢', style: TextStyle(fontSize: 18))]),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('查看更多', style: TextStyle(fontSize: 14)),
                  Icon(
                    CupertinoIcons.chevron_right,
                    size: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ],
          ),
          Container(
            height: 190,
            margin: EdgeInsets.only(top: 10),
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: numbersList.map((item) {
                return Container(
                  margin: EdgeInsets.only(
                    right: item == numbersList.length - 1 ? 0 : 10,
                  ),
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  width: 120,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 120,
                        height: 100,
                        margin: EdgeInsets.only(bottom: 4),
                        color: Colors.transparent,
                        child: Container(
                          color: Color.fromARGB(255, 192, 192, 192),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(2, 0, 1, 6),
                        child: Text(
                          '适乐肌肤舒缓高湿洁面乳100克',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(2, 0, 1, 6),
                        child: Text(
                          '非会员价￥88.00',
                          style: TextStyle(color: Colors.grey, fontSize: 10),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.fromLTRB(4, 0, 4, 2),
                                margin: EdgeInsets.only(right: 4),
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 253, 238, 202),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  '会员价',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 65, 42, 4),
                                  ),
                                ),
                              ),
                              Text('￥68.00', style: TextStyle(fontSize: 12)),
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 71, 223, 203),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            width: 20,
                            height: 20,
                            child: Icon(
                              CupertinoIcons.add,
                              size: 10,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  brand() {
    return Container(
      margin: EdgeInsets.only(top: 12),
      padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                margin: EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 190, 190, 190),
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('适乐肤', style: TextStyle(fontSize: 16)),
                  Text(
                    '在售22件商品',
                    style: TextStyle(
                      fontSize: 12,
                      color: const Color.fromARGB(255, 118, 118, 118),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Text('逛逛品牌', style: TextStyle(fontSize: 14)),
              Icon(
                CupertinoIcons.chevron_right,
                size: 12,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: buttonToor(),
      floatingActionButton: floatingActionButton(),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            bannerComponent(),
            Container(
              color: Color.fromARGB(255, 244, 244, 244),
              padding: EdgeInsets.fromLTRB(10, 6, 10, 10),
              child: Column(
                children: [
                  itemInformation(),
                  locationService(),
                  comment(),
                  recommend(),
                  brand(),
                  Container(
                    margin: EdgeInsets.only(top: 12),
                    color: Color.fromARGB(0, 172, 26, 26),
                    height: 200,
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
