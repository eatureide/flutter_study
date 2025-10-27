import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:fluttertoast/fluttertoast.dart';

List<int> numbersList = List.generate(10, (index) => index);

class ScrollItem {
  final ScrollController controller;
  bool selected = false;
  int count = 1;
  int price = 0;

  ScrollItem({
    required this.controller,
    required this.selected,
    required this.count,
    required this.price,
  });
}

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPage();
}

class _CartPage extends State<CartPage> {
  bool isAutoScrolling = false;
  bool allSelected = false;
  bool toastFinish = true;
  double totalPrice = 0.00;
  int selectedLength = 0;

  List<ScrollItem> controList = numbersList.map((index) {
    return ScrollItem(
      controller: ScrollController(),
      selected: false,
      count: 1,
      price: 97,
    );
  }).toList();

  @override
  initState() {
    super.initState();
    selectedLength = selectedCount();
  }

  handleSelectItem(int index) {
    setState(() {
      controList[index].selected = !controList[index].selected;
      if (!controList[index].selected) {
        double newTotalPrice =
            totalPrice - controList[index].price * controList[index].count;
        totalPrice = newTotalPrice;
      }
      if (controList[index].selected) {
        selectedCount();
      }
      controList = controList;
    });
  }

  selectedCount() {
    int price = 0;
    for (ScrollItem item in controList) {
      price = price + (item.price * item.count);
    }

    int count = controList.length;

    setState(() {
      selectedLength = count;
      totalPrice = price.toDouble();
    });

    return count;
  }

  void handleSelectAll() {
    for (ScrollItem item in controList) {
      item.selected = allSelected ? false : true;
    }
    setState(() {
      allSelected = !allSelected;
      controList = controList;
      selectedCount();
    });
  }

  itemListComponent() {
    bool onNotification(ScrollNotification notification, int targetIndex) {
      bool touchEnd = notification is ScrollEndNotification;
      if (!touchEnd) return false;
      isAutoScrolling = true;
      ScrollController scrollController = controList[targetIndex].controller;

      double currentOffset = scrollController.offset;
      double maxScrollExtent = scrollController.position.maxScrollExtent;

      // 滑动小于一半则返回到原点，超出则滑动到底部
      Future.delayed(Duration(seconds: 0), () {
        scrollController.animateTo(
          (currentOffset < maxScrollExtent / 2 + 10) ? 0 : maxScrollExtent,
          duration: Duration(milliseconds: 150),
          curve: Curves.easeInOut,
        );
      }).then((e) {
        isAutoScrolling = false;
      });

      return false;
    }

    handleDelete(bool confirm, index) {
      ScrollController scrollController = controList[index].controller;
      scrollController.animateTo(
        0,
        duration: Duration(milliseconds: 150),
        curve: Curves.easeInOut,
      );

      Future.delayed(Duration(microseconds: 200), () {
        if (confirm != true) return;
        controList.removeAt(index);
        setState(() {
          controList = controList;
        });
      });
      Navigator.of(context).pop();
    }

    handleDeleteDialog(int index) {
      showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return Dialog(
            child: SizedBox(
              height: 186,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                ),
                padding: EdgeInsets.fromLTRB(12, 20, 12, 0),
                child: Column(
                  children: [
                    Text(
                      '提示',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                      color: Colors.transparent,
                      child: Text('将当前商品移出购物车', style: TextStyle(fontSize: 16)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            handleDelete(false, index);
                          },
                          child: Container(
                            width: 145,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: Colors.black, width: 1),
                            ),
                            child: Center(
                              child: Text('取消', textAlign: TextAlign.center),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            handleDelete(true, index);
                          },
                          child: Container(
                            width: 145,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 91, 234, 208),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Center(
                              child: Text(
                                '确定',
                                style: TextStyle(color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    }

    handleCount(String actionType, int index) {
      if (actionType == 'increment') {
        controList[index].count = controList[index].count + 1;
      }
      if (actionType == 'decrement' && !toastFinish) return;
      if (actionType == 'decrement' && controList[index].count <= 1) {
        toastFinish = false;
        Future.delayed(Duration(seconds: 3), () {
          toastFinish = true;
        });
        Fluttertoast.showToast(
          gravity: ToastGravity.CENTER,
          msg: "最少保留一个商品",
          backgroundColor: Colors.black54,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        return;
      }
      if (actionType == 'decrement') {
        controList[index].count = controList[index].count - 1;
      }
      setState(() {
        controList[index].selected = true;
        controList = controList;
        selectedCount();
      });
    }

    List<Widget> elements = controList.asMap().entries.map((elem) {
      int index = elem.key;
      ScrollItem item = controList[index];

      return Container(
        margin: EdgeInsets.only(bottom: 20),
        color: Colors.transparent,
        height: 140,
        child: NotificationListener(
          onNotification: (ScrollNotification notification) {
            return onNotification(notification, index);
          },
          child: ListView(
            controller: item.controller,
            scrollDirection: Axis.horizontal,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.transparent,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            handleSelectItem(index);
                          },
                          child: Container(
                            padding: EdgeInsetsGeometry.only(left: 12),
                            child: Icon(
                              item.selected
                                  ? CupertinoIcons.checkmark_alt_circle_fill
                                  : CupertinoIcons.circle,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 102, 239, 208),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          width: 100,
                          height: 100,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 8),
                    width: 246,
                    color: Colors.transparent,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          color: Colors.transparent,
                          width: 220,
                          child: Text(
                            '适乐肤缓净泡沫洁面着哩236ml $index',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
                          color: const Color.fromARGB(20, 244, 67, 54),
                          margin: EdgeInsets.only(bottom: 6),
                          child: Text(
                            '会员价368元/件',
                            style: TextStyle(color: Colors.red, fontSize: 10),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
                          color: const Color.fromARGB(20, 244, 67, 54),
                          margin: EdgeInsets.only(bottom: 10),
                          child: Text(
                            '加18.9换购林清玄精华水30ml',
                            style: TextStyle(color: Colors.red, fontSize: 10),
                          ),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.fromLTRB(4, 0, 4, 2),
                                      margin: EdgeInsets.only(right: 4),
                                      decoration: BoxDecoration(
                                        color: Color.fromARGB(
                                          255,
                                          253,
                                          238,
                                          202,
                                        ),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Text(
                                        '会员价',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromARGB(255, 65, 42, 4),
                                        ),
                                      ),
                                    ),
                                    Text('￥', style: TextStyle(fontSize: 10)),
                                    Text(
                                      '${item.price}',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ],
                                ),
                                Text(
                                  '非会员价￥239',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),

                            Container(
                              margin: EdgeInsets.only(right: 16),
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                  color: const Color.fromARGB(54, 56, 56, 56),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      handleCount('decrement', index);
                                    },
                                    child: Container(
                                      width: 25,
                                      color: const Color.fromARGB(
                                        0,
                                        255,
                                        255,
                                        255,
                                      ),
                                      child: Text(
                                        '—',
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 1,
                                    height: 10,
                                    color: const Color.fromARGB(36, 0, 0, 0),
                                  ),
                                  Container(
                                    width: 25,
                                    color: Colors.transparent,
                                    child: Text(
                                      '${item.count}',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    width: 1,
                                    height: 10,
                                    color: const Color.fromARGB(36, 0, 0, 0),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      handleCount('increment', index);
                                    },
                                    child: Container(
                                      width: 25,
                                      color: const Color.fromARGB(
                                        0,
                                        255,
                                        255,
                                        255,
                                      ),
                                      child: Text(
                                        '+',
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      handleDeleteDialog(index);
                    },
                    child: Container(
                      width: 60,
                      color: Color.fromARGB(255, 254, 79, 79),
                      child: Center(
                        child: Text(
                          '删除',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }).toList();

    if (controList.isEmpty) {
      return Text('购物车空空如也');
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: handleSelectAll,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                size: 20,
                allSelected
                    ? CupertinoIcons.checkmark_alt_circle_fill
                    : CupertinoIcons.circle,
              ),
              Container(
                color: Colors.transparent,
                margin: EdgeInsets.only(left: 4),
                child: Text('屈臣氏'),
              ),
              Icon(CupertinoIcons.right_chevron, size: 12),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
          margin: EdgeInsets.fromLTRB(0, 12, 0, 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(children: elements),
        ),
      ],
    );
  }

  navBar() {
    String showPrice = totalPrice.toStringAsFixed(2);
    return Container(
      color: Colors.transparent,
      height: 70,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            height: 70,
            color: Colors.white,
            padding: EdgeInsets.fromLTRB(16, 0, 12, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: handleSelectAll,
                  child: Container(
                    color: Colors.transparent,
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 6),
                          child: Icon(
                            allSelected
                                ? CupertinoIcons.checkmark_alt_circle_fill
                                : CupertinoIcons.circle,
                          ),
                        ),
                        Text('已选($selectedLength)'),
                      ],
                    ),
                  ),
                ),
                Container(
                  color: Colors.transparent,
                  child: Row(
                    children: [
                      Text('合计：'),
                      Text('￥', style: TextStyle(fontSize: 10)),
                      Text(showPrice, style: TextStyle(fontSize: 16)),
                      Container(
                        width: 110,
                        height: 46,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 103, 239, 208),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        margin: EdgeInsets.only(left: 10),
                        child: Center(
                          child: Text(
                            '结算',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 244, 244, 244),
      bottomNavigationBar: navBar(),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.fromLTRB(10, 50, 10, 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [itemListComponent()],
          ),
        ),
      ),
    );
  }
}
