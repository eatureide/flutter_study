import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Nav extends StatefulWidget {
  const Nav({super.key});

  @override
  State<Nav> createState() => _Nav();
}

class _Nav extends State<Nav> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      fixedColor: Colors.blue,
      onTap: (flag) {
        setState(() {
          _currentIndex = flag;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.home, size: 20),
          activeIcon: Icon(CupertinoIcons.home, size: 20),
          label: ('首页'),
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.shopping_cart, size: 20),
          activeIcon: Icon(CupertinoIcons.shopping_cart, size: 20),
          label: ('商城'),
        ),
      ],
    );
  }
}
