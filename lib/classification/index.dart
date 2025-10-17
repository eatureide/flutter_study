import 'package:flutter/material.dart';
import 'search.dart';
import 'tabs.dart';
import 'content.dart';

class Classification extends StatefulWidget {
  const Classification({super.key});

  @override
  State<Classification> createState() => _Classification();
}

class _Classification extends State<Classification> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
      color: Color.fromARGB(255, 239, 245, 247),
      // color:Colors.red,
      width: double.infinity,
      height: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [Search(), Tabs(), Content()],
      ),
    );
  }
}
