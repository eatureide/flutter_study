import 'package:flutter/material.dart';
import 'search.dart';
import 'tabs.dart';

class Classification extends StatefulWidget {
  const Classification({super.key});

  @override
  State<Classification> createState() => _Classification();
}

class _Classification extends State<Classification> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
      color: Color.fromARGB(255, 239, 245, 247),
      width: double.infinity,
      height: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Search(),
          Tabs()
        ],
      ),
    );
  }
}
