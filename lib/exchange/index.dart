import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../utils.dart';

List<int> numbersList = List.generate(10, (index) => index);

class ExChange extends StatefulWidget {
  const ExChange({super.key});

  @override
  State<ExChange> createState() => _ExChange();
}

class TabElement {
  String title = '';
  int index = 0;
  int count = 0;
  TabElement({required this.title, required this.index, required this.count});
}

class ItemElement {
  String title = '';
  double price = 0.00;
  double originalPrice = 00.00;
  int count = 0;
  int index = 0;

  ItemElement({
    required this.title,
    required this.price,
    required this.originalPrice,
    required this.count,
    required this.index,
  });
}

List<ItemElement> itemListA = numbersList.map((index) {
  return ItemElement(
    title: '奥妙除螨洗衣液950克',
    price: 23.00,
    originalPrice: 72.00,
    count: 0,
    index: index,
  );
}).toList();

List<ItemElement> itemListB = numbersList.map((index) {
  return ItemElement(
    title: '屈臣氏牌全柔巾洁面75片',
    price: 20.00,
    originalPrice: 39.00,
    count: 0,
    index: index,
  );
}).toList();

List<ItemElement> itemListC = numbersList.map((index) {
  return ItemElement(
    title: '屈臣氏气泡水',
    price: 5.00,
    originalPrice: 12.00,
    count: 0,
    index: index,
  );
}).toList();

List<ItemElement> itemListD = numbersList.map((index) {
  return ItemElement(
    title: '屈臣氏茶饮料',
    price: 3.00,
    originalPrice: 6.00,
    count: 0,
    index: index,
  );
}).toList();

class _ExChange extends State<ExChange> {
  final ScrollController _scrollController = ScrollController();
  int tabCurrentIndex = 0;
  int tabTotalCount = 0;

  List<TabElement> tabDats = [
    TabElement(title: '单件换购', index: 0, count: 0),
    TabElement(title: '多件换购', index: 1, count: 0),
    TabElement(title: '多件换购', index: 2, count: 0),
    TabElement(title: '多件换购', index: 3, count: 0),
  ];

  List<List<ItemElement>> combineList = [
    itemListA,
    itemListB,
    itemListC,
    itemListD,
  ];

  headerTab() {
    TextStyle curStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );
    TextStyle nornamStyle = TextStyle(fontSize: 14, color: Colors.black);

    setIndex(int index) {
      setState(() {
        tabCurrentIndex = index;
      });
    }

    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(20, 40, 20, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: tabDats.map((item) {
          return GestureDetector(
            onTap: () {
              setIndex(item.index);
            },
            child: Container(
              color: Colors.transparent,
              child: Column(
                children: [
                  AnimatedDefaultTextStyle(
                    style: item.index == tabCurrentIndex
                        ? curStyle
                        : nornamStyle,
                    duration: const Duration(milliseconds: 100),
                    child: Text(item.title),
                  ),
                  Text(
                    '已选购${item.count}件',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  Opacity(
                    opacity: item.index == tabCurrentIndex ? 1 : 0,
                    child: Container(
                      width: 20,
                      height: 2,
                      margin: EdgeInsets.only(top: 5),
                      color: Color.fromARGB(255, 145, 250, 209),
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

  handleCount(String actionType, int index) {
    List<ItemElement> target = combineList[tabCurrentIndex]; // 当前的商品列表
    TabElement tabElm = tabDats[tabCurrentIndex]; // 当前的tab

    // 少于0时，视为0
    if (actionType == 'decrement' && target[index].count <= 0) {
      target[index].count = 0;
      return;
    }

    // 增加商品数量
    if (actionType == 'increment') {
      target[index].count = target[index].count + 1;
    }

    // 减少数量
    if (actionType == 'decrement') {
      target[index].count = target[index].count - 1;
    }

    // 重新计算当前列表的总数
    tabElm.count = 0;
    for (ItemElement item in target) {
      tabElm.count = tabElm.count + item.count;
    }

    tabTotalCount = 0;
    for (int i = 0; i < combineList.length; i++) {
      for (ItemElement item in combineList[i]) {
        tabTotalCount = tabTotalCount + item.count;
      }
    }

    setState(() {
      tabDats = tabDats;
      combineList = combineList;
      tabTotalCount = tabTotalCount;
    });
  }

  mainBox() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.fromLTRB(10, 15, 0, 15),
      color: Colors.white,
      child: Column(
        children: combineList[tabCurrentIndex].map((item) {
          Widget countComponent() {
            return Container(
              height: 25,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  width: 1,
                  color: const Color.fromARGB(156, 158, 158, 158),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      handleCount('decrement', item.index);
                    },
                    child: Container(
                      width: 20,
                      color: Colors.transparent,
                      child: Center(child: Text('—')),
                    ),
                  ),
                  Container(
                    width: 20,
                    color: Colors.transparent,
                    child: Center(child: Text('${item.count}')),
                  ),
                  GestureDetector(
                    onTap: () {
                      handleCount('increment', item.index);
                    },
                    child: Container(
                      width: 20,
                      color: Colors.transparent,
                      child: Center(child: Text('+')),
                    ),
                  ),
                ],
              ),
            );
          }

          Widget cartIcon() {
            return GestureDetector(
              onTap: () {
                handleCount('increment', item.index);
              },
              child: Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 55, 218, 206),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(CupertinoIcons.cart, size: 14, color: Colors.white),
              ),
            );
          }

          return Container(
            color: Colors.transparent,
            margin: EdgeInsets.only(bottom: 16),
            child: Row(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 142, 250, 198),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  margin: EdgeInsets.only(right: 10),
                ),
                Expanded(
                  child: Container(
                    color: Colors.transparent,
                    padding: EdgeInsets.only(right: 10),
                    height: 80,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item.title),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              color: Colors.transparent,
                              height: 20,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text('￥', style: TextStyle(fontSize: 10)),
                                  Text(
                                    '${item.price}',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  Container(
                                    height: 20,
                                    padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
                                    margin: EdgeInsets.fromLTRB(4, 0, 4, 0),
                                    color: Color.fromARGB(255, 145, 250, 209),
                                    child: Center(
                                      child: Text(
                                        '换购价',
                                        style: TextStyle(fontSize: 10),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '￥${item.originalPrice}',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            item.count <= 0 ? cartIcon() : countComponent(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  narbar() {
    return Container(
      color: Colors.white,
      height: 70,
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('已选（$tabTotalCount）件换购商品'),
          Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 55, 218, 206),
              borderRadius: BorderRadius.circular(70),
            ),
            width: 100,
            height: 40,
            child: Center(
              child: Text('去购物车', style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 242, 242, 242),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(75.0),
        child: headerTab(),
      ),
      bottomNavigationBar: narbar(),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Container(
          // padding: EdgeInsets.only(top: 40),
          color: Colors.transparent,
          child: Column(children: [mainBox()]),
        ),
      ),
    );
  }
}
