import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _Search();
}

class _Search extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 260,
          color: Colors.transparent,
          child: TextField(
            style: TextStyle(fontSize: 12),
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
                borderSide: BorderSide(color: Colors.transparent),
              ),
              // 3. 聚焦（选中）状态的圆角边框
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
                borderSide: BorderSide(color: Colors.transparent),
              ),
              hintText: '百雀羚买一送一',
              border: InputBorder.none,
              isDense: true,
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
