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
      child: SingleChildScrollView(
        child: Stack(
          clipBehavior: Clip.hardEdge,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Search(), Container(height: 85), Text('next')],
            ),
            Positioned(top: 60, left: 0, width: 350, height: 60, child: Tabs()),
          ],
        ),
      ),
    );
  }
}
