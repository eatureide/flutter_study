import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';

List<int> numbersList = List.generate(10, (index) => index);

class ScrollItem {
  final ScrollController controller;
  final int index;
  bool selected = false;
  ScrollItem({
    required this.controller,
    required this.index,
    required this.selected,
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
  List<ScrollItem> controList = numbersList.map((index) {
    return ScrollItem(
      controller: ScrollController(),
      index: index,
      selected: false,
    );
  }).toList();

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

    handleSelectItem(int index) {
      setState(() {
        controList[index].selected = !controList[index].selected;
        controList = controList;
      });
    }

    List<Widget> elements = controList.map((item) {
      return Container(
        margin: EdgeInsets.only(bottom: 20),
        color: Colors.transparent,
        height: 100,
        child: NotificationListener(
          onNotification: (ScrollNotification notification) {
            return onNotification(notification, item.index);
          },
          child: ListView(
            controller: item.controller,
            scrollDirection: Axis.horizontal,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      handleSelectItem(item.index);
                    },
                    child: Padding(
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
                      child: Text('删除', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }).toList();

    void handleSelectAll() {
      for (ScrollItem item in controList) {
        item.selected = allSelected ? false : true;
      }
      setState(() {
        allSelected = !allSelected;
        controList = controList;
      });
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
              Icon(CupertinoIcons.right_chevron, size: 14),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.fromLTRB(0, 20, 0, 6),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          color: Color.fromARGB(255, 244, 244, 244),
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
