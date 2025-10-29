import 'package:flutter/material.dart';

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

List<TabElement> tabDats = [
  TabElement(title: '单件换购', index: 0, count: 0),
  TabElement(title: '多件换购', index: 1, count: 0),
  TabElement(title: '多件换购', index: 2, count: 0),
  TabElement(title: '多件换购', index: 3, count: 0),
];

List<int> numbersList = List.generate(10, (index) => index);

class _ExChange extends State<ExChange> {
  final ScrollController _scrollController = ScrollController();
  int tabCurrentIndex = 0;

  headerTab() {
    TextStyle curStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
    TextStyle nornamStyle = TextStyle(fontSize: 14);

    setIndex(int index) {
      setState(() {
        tabCurrentIndex = index;
      });
    }

    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
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
                  Text(
                    item.title,
                    style: item.index == tabCurrentIndex
                        ? curStyle
                        : nornamStyle,
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

  mainBox() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.fromLTRB(10, 15, 0, 15),
      color: Colors.white,
      child: Column(
        children: numbersList.map((item) {
          return Container(
            color: Colors.transparent,
            margin: EdgeInsets.only(bottom: 16),
            child: Row(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  color: Colors.red,
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
                        Text('奥妙除螨洗衣液950克'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              color: Colors.transparent,
                              child: Row(
                                children: [
                                  Text('￥', style: TextStyle(fontSize: 10)),
                                  Text('10.9', style: TextStyle(fontSize: 16)),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
                                    margin: EdgeInsets.fromLTRB(4, 0, 4, 0),
                                    color: Color.fromARGB(255, 145, 250, 209),
                                    child: Text(
                                      '换购价',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                  width: 1,
                                  color: const Color.fromARGB(
                                    156,
                                    158,
                                    158,
                                    158,
                                  ),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 20,
                                    color: Colors.transparent,
                                    child: Center(child: Text('—')),
                                  ),
                                  Container(
                                    width: 20,
                                    color: Colors.transparent,
                                    child: Center(child: Text('0')),
                                  ),
                                  Container(
                                    width: 20,
                                    color: Colors.transparent,
                                    child: Center(child: Text('+')),
                                  ),
                                ],
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
        }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 242, 242, 242),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Container(
          padding: EdgeInsets.only(top: 40),
          color: Colors.transparent,
          child: Column(children: [headerTab(), mainBox()]),
        ),
      ),
    );
  }
}
