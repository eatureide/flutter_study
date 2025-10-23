import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

typedef TapCallBack = void Function(int flag);

class Nav extends StatefulWidget {
  final TapCallBack onTap;
  final int currentIndex;
  const Nav({super.key, required this.onTap, required this.currentIndex});

  @override
  State<Nav> createState() => _Nav();
}

class _Nav extends State<Nav> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.currentIndex,
      type: BottomNavigationBarType.fixed,
      fixedColor: Colors.blue,
      onTap: (flag) {
        widget.onTap(flag);
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.home, size: 20),
          label: ('首页'),
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.cube_box, size: 20),
          label: ('商城'),
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.shopping_cart, size: 20),
          label: ('购物车'),
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.square_grid_2x2, size: 20),
          label: ('分类'),
        ),
      ],
    );
  }
}
