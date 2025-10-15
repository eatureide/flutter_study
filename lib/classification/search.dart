import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _Search();
}

class _Search extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(36),
      ),
      padding: EdgeInsets.only(left: 6),
      child: Stack(
        alignment: AlignmentDirectional.centerStart,
        children: [
          Icon(
            CupertinoIcons.search,
            size: 26,
            color: Color.fromARGB(255, 47, 238, 236),
          ),
          Positioned(
            left: 26,
            child: Container(
              width: 170,
              height: 36,
              color: Colors.transparent,
              child: TextField(
                style: TextStyle(fontSize: 12),
                decoration: InputDecoration(
                  hintText: '百雀羚买一送一',
                  border: InputBorder.none,
                  isDense: true,
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal:6,
                    vertical: 10,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            right: 2,
            child: Container(
              width: 50,
              height: 36,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 47, 238, 236),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(
                CupertinoIcons.viewfinder,
                size: 24,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
