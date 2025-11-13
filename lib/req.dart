import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import './utils.dart';

class Req extends StatefulWidget {
  const Req({super.key});

  @override
  State<Req> createState() => _Req();
}

class GitDataItem {
  String fullName;
  GitDataItem({required this.fullName});
}

class _Req extends State<Req> {
  Dio dio = Dio();
  List<GitDataItem> gitDataList = [];

  @override
  void initState() {
    super.initState();
    handleReq();
  }

  handleReq() async {
    Response response = await dio.get(
      "https://api.github.com/orgs/flutterchina/repos",
    );
    List<dynamic> data = response.data;
    if (data.isEmpty) return;

    gitDataList = data.map((item) {
      return GitDataItem(fullName: item['full_name']);
    }).toList();

    setState(() {
      gitDataList = gitDataList;
    });
  }

  renderList() {
    if (gitDataList.isEmpty) return [CircularProgressIndicator()];
    return gitDataList.map((item) {
      return ListTile(title: Text(item.fullName));
    }).toList();
  }

  @override
  build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Request')),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [...renderList()],
        ),
      ),
    );
  }
}
