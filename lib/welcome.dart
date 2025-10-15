import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _Welcome();
}

class _Welcome extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: EdgeInsets.only(top: 10),
          color: Colors.transparent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '下午好，XXX小主',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                '事情一堆，奶茶来一杯',
                style: TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(255, 145, 144, 144),
                ),
              ),
            ],
          ),
        ),
        Container(
          color: Colors.transparent,
          child: Row(
            children: [
              Container(
                width: 1,
                height: 20,
                color: Colors.black,
                margin: EdgeInsets.only(right: 10),
              ),
              Text('11', style: TextStyle(fontSize: 28)),
              Container(
                margin: EdgeInsets.only(left: 10),
                color: Colors.transparent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'TODAY',
                      style: TextStyle(
                        fontSize: 8,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('10月', style: TextStyle(fontSize: 8)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
