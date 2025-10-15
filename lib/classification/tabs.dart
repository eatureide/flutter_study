import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

final List<Map<String, dynamic>> itemData = const [
  {"title": "中小样"},
  {"title": "中小样"},
  {"title": "中小样"},
  {"title": "中小样"},
  {"title": "中小样"},
  {"title": "中小样"},
  {"title": "中小样"},
  {"title": "中小样"},
  {"title": "中小样"},
  {"title": "中小样"},
  {"title": "中小样"},
  {"title": "中小样"},
];

class IconItem extends StatelessWidget {
  final String title;
  const IconItem({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 40,
          height: 36,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 220, 220, 220),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        Text(title, style: TextStyle(fontSize: 12)),
      ],
    );
  }
}

final List<Map<String, dynamic>> indexedData = itemData.asMap().entries.map((
  entry,
) {
  return {...entry.value, 'index': entry.key};
}).toList();

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _Tabs();
}

class _Tabs extends State<Tabs> {
  bool pop = false;

  handleSwitchPop() {
    setState(() {
      print('in');
      pop = !pop;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      color: Colors.transparent,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 150),
              width: 350,
              height: pop ? 200 : 60,
              color: Color.fromARGB(255, 239, 245, 247),
              child: Container(
                width: 300,
                height: 60,
                color: Colors.transparent,
                child: ListView(
                  padding: EdgeInsets.zero,
                  clipBehavior: Clip.hardEdge,
                  scrollDirection: pop ? Axis.vertical : Axis.horizontal,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: itemData.sublist(0, 5).map((item) {
                        return Container(
                          width: 60,
                          height: 60,
                          margin: EdgeInsets.only(top: 6),
                          color: Colors.transparent,
                          child: IconItem(title: item['title']),
                        );
                      }).toList(),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: itemData.sublist(6, 11).map((item) {
                        return Container(
                          width: 60,
                          height: 60,
                          color: Colors.transparent,
                          margin: EdgeInsets.only(top: 6),
                          child: IconItem(title: item['title']),
                        );
                      }).toList(),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: itemData.sublist(6, 11).map((item) {
                        return Container(
                          width: 60,
                          height: 60,
                          color: Colors.transparent,
                          margin: EdgeInsets.only(top: 6),
                          child: IconItem(title: item['title']),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: GestureDetector(
              onTap: handleSwitchPop,
              child: Container(
                width: 30,
                height: 60,
                color: Color.fromARGB(255, 239, 245, 247),
                child: Column(
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
