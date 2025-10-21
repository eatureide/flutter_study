import 'package:flutter/material.dart';

final List<Map<String, dynamic>> carData = [
  {
    "picurl": "https://mall.flutterschool.cn/images/xhs/1.png",
    "title": "豪华轿车 - 车型A",
  },
  {
    "picurl": "https://mall.flutterschool.cn/images/xhs/1.png",
    "title": "电动汽车 - 车型D",
  },
  {
    "picurl": "https://mall.flutterschool.cn/images/xhs/1.png",
    "title": "电动汽车 - 车型D",
  },
  {
    "picurl": "https://mall.flutterschool.cn/images/xhs/1.png",
    "title": "电动汽车 - 车型D",
  },
  {
    "picurl": "https://mall.flutterschool.cn/images/xhs/1.png",
    "title": "电动汽车 - 车型D",
  },
  {
    "picurl": "https://mall.flutterschool.cn/images/xhs/1.png",
    "title": "电动汽车 - 车型D",
  },
  {
    "picurl": "https://mall.flutterschool.cn/images/xhs/1.png",
    "title": "电动汽车 - 车型D",
  },
];

class Item extends StatelessWidget {
  final String type;
  const Item({super.key, required this.type});

  @override
  build(BuildContext context) {
    return Container(
      width: 180,
      height: 230,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.white,
      ),
      margin: EdgeInsets.only(bottom: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/detail');
        },
        child: Column(
          children: [
            Container(
              width: 180,
              height: 120,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 220, 220, 220),
                borderRadius: BorderRadiusDirectional.only(
                  topStart: Radius.circular(6),
                  topEnd: Radius.circular(6),
                ),
              ),
            ),
            Container(
              padding: EdgeInsetsGeometry.only(left: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('蜡笔小新手持风扇（小白款）'),
                  Text(
                    '小新与你清凉一夏',
                    style: TextStyle(color: Color.fromARGB(255, 139, 139, 139)),
                    textAlign: TextAlign.left,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 6),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text('￥', style: TextStyle(fontSize: 10)),
                        Text('24.9', style: TextStyle(fontSize: 20)),
                        Text(
                          '￥69',
                          style: TextStyle(
                            color: Color.fromARGB(255, 139, 139, 139),
                            fontSize: 10,
                            decoration: TextDecoration.lineThrough,
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

class MyList extends StatefulWidget {
  const MyList({super.key});

  @override
  State<MyList> createState() => _MyList();
}

class _MyList extends State<MyList> {
  @override
  build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: carData.map((item) {
            return Item(type: 'red');
          }).toList(),
        ),
        Container(width: 10),
        Column(
          children: carData.map((item) {
            return Item(type: 'blue');
          }).toList(),
        ),
      ],
    );
  }
}
