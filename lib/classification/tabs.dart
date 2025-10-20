import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

final List<Map<String, dynamic>> data = const [
  {"title": "为您推荐"},
  {"title": "跨境购"},
  {"title": "中小样"},
  {"title": "肌肤护理"},
  {"title": "个人护理"},
  {"title": "女性护理"},
  {"title": "口腔护理"},
  {"title": "美发护发"},
  {"title": "潮流彩妆"},
  {"title": "美妆工具"},
  {"title": "男士专区"},
  {"title": "品质生活"},
  {"title": "计生情趣"},
  {"title": "零食饮料"},
  {"title": "电器"},
  {"title": "营养保底"},
  {"title": "母婴生活"},
  {"title": "大牌香氛"},
  {"title": "IP专区"},
  {"title": "奥莱专区"},
];

final List<Map<String, dynamic>> itemData = data.asMap().entries.map((entry) {
  return {...entry.value, 'index': entry.key};
}).toList();

typedef TapCallBack = void Function(int flag);

class IconItem extends StatelessWidget {
  final String title;
  final TapCallBack onTap;
  final int index;
  final int currentIndex;

  const IconItem({
    super.key,
    required this.title,
    required this.onTap,
    required this.index,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(index);
      },
      child: Container(
        margin: EdgeInsets.only(left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 52,
              height: 50,
              margin: EdgeInsets.only(bottom: 6),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 220, 220, 220),
                borderRadius: BorderRadius.circular(22),
                border: Border.all(
                  width: 2,
                  color: currentIndex == index
                      ? Color.fromARGB(255, 47, 238, 236)
                      : Colors.white,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
              decoration: BoxDecoration(
                color: currentIndex == index
                    ? Color.fromARGB(255, 47, 238, 236)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: currentIndex == index ? Colors.white : Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _Tabs();
}

class _Tabs extends State<Tabs> {
  int currentIndex = 0;

  handleIconClick(index) {
    setState(() {
      currentIndex = index;
    });
  }

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
      // color:Colors.red,
      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
      padding: EdgeInsets.only(right: 0),
      width: double.infinity,
      height: 84,
      child: Stack(
        children: [
          ListView(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.fromLTRB(0, 0, 46, 0),
            children: itemData.map((item) {
              return IconItem(
                index: item['index'],
                title: item['title'],
                onTap: (index) {
                  handleIconClick(index);
                },
                currentIndex: currentIndex,
              );
            }).toList(),
          ),
          Positioned(
            top: 0,
            right: -1,
            bottom: -1,
            child: GestureDetector(
              onTap: () {
                showDialog(
                  barrierColor: Colors.transparent,
                  context: context,
                  barrierDismissible: true,
                  builder: (BuildContext context) {
                    final mediaQueryData = MediaQuery.of(context);
                    final screenWidth = mediaQueryData.size.width;

                    moveTo(int index) {
                      double indexDouble = index.toDouble();
                      double offset = indexDouble * 52.0;
                      _scrollController.animateTo(
                        offset,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    }

                    return StatefulBuilder(
                      builder:
                          (BuildContext context, StateSetter dialogSetState) {
                            return Stack(
                              children: [
                                Positioned(
                                  top: 100,
                                  width: 1000,
                                  height: 1000,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                          107,
                                          0,
                                          0,
                                          0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 70,
                                  left: 0,
                                  child: Container(
                                    padding: EdgeInsets.only(left: 5),
                                    width: screenWidth,
                                    height: 380,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 239, 245, 247),
                                      gradient: LinearGradient(
                                        colors: [
                                          Color.fromARGB(255, 239, 245, 247),
                                          Colors.white,
                                        ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                    ),
                                    child: GridView.count(
                                      crossAxisCount: 5,
                                      children: itemData.map((item) {
                                        return IconItem(
                                          index: item['index'],
                                          title: item['title'],
                                          currentIndex: currentIndex,
                                          onTap: (index) {
                                            dialogSetState(() {
                                              currentIndex = index;
                                            });
                                            handleIconClick(index);
                                            moveTo(index);
                                            Navigator.of(context).pop();
                                          },
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 420,
                                  left: 0,
                                  right: 0,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '点击收起',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        Icon(
                                          CupertinoIcons.arrowtriangle_up_fill,
                                          size: 8,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                    );
                  },
                );
              },
              child: Container(
                color: Color.fromARGB(255, 239, 245, 247),
                width: 50,
                height: 60,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('全', style: TextStyle(fontSize: 12)),
                    Text('部', style: TextStyle(fontSize: 12)),
                    Container(
                      margin: EdgeInsets.only(top: 2),
                      color: Colors.transparent,
                      child: Icon(
                        CupertinoIcons.arrowtriangle_down_fill,
                        size: 8,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
