import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Index extends StatefulWidget {
  const Index({super.key});

  @override
  State<Index> createState() => _Index();
}

class _Index extends State<Index> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '我的 Material 3 应用',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromARGB(255, 156, 104, 247),
        ),
      ),
      home: swiper(),
    );
  }

  swiperItem() {
    return OverflowBox(
      maxHeight: double.infinity,
      child: ClipRect(
        child: Container(
          width: double.infinity,
          height: 600,
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 300,
                color: const Color.fromARGB(255, 156, 104, 247),
              ),
              Container(
                color: Colors.transparent,
                padding: EdgeInsets.all(10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text('￥', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(
                      '3',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '.00',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.transparent),
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('屈臣氏饮用水（蒸馏制法）', style: TextStyle(fontSize: 18)),
                    Text('滴滴清纯 健康有益'),
                    Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 225, 231, 253),
                      ),

                      height: 30,
                      margin: EdgeInsets.fromLTRB(0, 12, 0, 0),
                      padding: EdgeInsets.only(left: 10),
                      width: double.infinity,
                      child: Row(children: [Text('TOP 饮用水热销榜第1名')]),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.transparent,
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                margin: EdgeInsets.only(top: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(children: [Icon(CupertinoIcons.cart), Text('购物车')]),
                    Row(
                      children: [
                        Container(
                          color: Colors.transparent,
                          margin: EdgeInsets.only(right: 12),
                          child: OutlinedButton(
                            onPressed: onPressed,
                            child: Text('立即购买'),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: onPressed,
                          child: Text('加入购物车'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  swiper() {
    return Scaffold(
      backgroundColor: const Color.fromARGB(100, 0, 0, 0),
      body: CarouselView(
        scrollDirection: Axis.vertical,
        itemExtent: 500,
        children: List.generate(100, (int index) {
          return swiperItem();
        }),
      ),
    );
  }

  onPressed() {}

  mainBox() {
    return Scaffold(
      appBar: AppBar(title: const Text('Material 3 Apps')),
      backgroundColor: Color.fromARGB(255, 242, 242, 242),
      body: Column(
        children: [
          ElevatedButton(onPressed: onPressed, child: const Text('Elevated')),
          FilledButton(onPressed: onPressed, child: const Text('Filled')),
          FilledButton.tonal(
            onPressed: onPressed,
            child: const Text('Filled Tonal'),
          ),
          OutlinedButton(onPressed: onPressed, child: const Text('Outlined')),
          TextButton(onPressed: onPressed, child: const Text('Text')),
        ],
      ),
    );
  }
}
