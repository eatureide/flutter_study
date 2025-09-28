import 'package:flutter/material.dart';

class ContainerAlign extends StatelessWidget {
  const ContainerAlign({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 200,
      color: Colors.blue,
      child:  Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Text(
              "ele1",
              style: TextStyle(
                fontSize: 20,
                color: const Color.fromARGB(255, 2, 255, 11),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              "ele2",
              style: TextStyle(
                fontSize: 20,
                color: const Color.fromARGB(255, 255, 230, 0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
