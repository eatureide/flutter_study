import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPage();
}

class _CartPage extends State<CartPage> {
  final ScrollController _scrollController = ScrollController();
  bool _isAutoScrolling = false;
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  _onScroll() {}

  // 监听滚动是否结束
  bool _onNotification(ScrollNotification notification) {
    bool touchEnd = notification is ScrollEndNotification;
    if (!touchEnd) return false;

    double currentOffset = _scrollController.offset; // 当前滚动位置
    double maxScrollExtent =
        _scrollController.position.maxScrollExtent; // 当前可滚动的最大距离

    if (_isAutoScrolling) return false;
    _isAutoScrolling = true;

    // 滑动小于一半则返回到原点，超出则滑动到底部
    Future.delayed(Duration(seconds: 0), () {
      _scrollController.animateTo(
        (currentOffset < maxScrollExtent / 2 + 10) ? 0 : maxScrollExtent,
        duration: Duration(milliseconds: 150),
        curve: Curves.easeInOut,
      );
    }).then((e) {
      _isAutoScrolling = false;
    });

    return false;
  }

  itemListComponent() {
    return Container(
      height: 500,
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(12, 20, 12, 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Container(
            color: Colors.transparent,
            height: 100,
            child: NotificationListener(
              onNotification: _onNotification,
              child: ListView(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Opacity(
                        opacity: .5,
                        child: Icon(CupertinoIcons.check_mark_circled),
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
                      Container(
                        padding: EdgeInsets.only(left: 8),
                        width: 240,
                        color: Colors.transparent,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              color: Colors.transparent,
                              width: 220,
                              child: Text(
                                '适乐肤缓净泡沫洁面着哩236ml',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 60,
                        color: Color.fromARGB(255, 254, 79, 79),
                        child: Center(
                          child: Text(
                            '删除',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: 800,
          color: Color.fromARGB(255, 244, 244, 244),
          padding: EdgeInsets.fromLTRB(10, 6, 10, 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 100,
                color: Colors.white,
                width: double.infinity,
                margin: EdgeInsets.only(bottom: 20),
              ),
              itemListComponent(),
            ],
          ),
        ),
      ),
    );
  }
}
