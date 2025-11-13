import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import '../utils.dart';

Map<String, dynamic> data = {
  'user_id': 1001,
  'username': 'Alice',
  'details': {'city': 'New York', 'zip': '10001'},
};

class Echo extends StatelessWidget {
  const Echo({
    super.key,
    required this.text,
    this.backgroundColor = Colors.grey,
  });

  final String text;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(color: backgroundColor, child: Text(text)),
    );
  }
}

class CountPage extends StatelessWidget {
  const CountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Count();
  }
}

class Count extends StatefulWidget {
  const Count({super.key, this.initValue = 10});
  final int initValue;

  @override
  State<Count> createState() => _Count();
}

class _Count extends State<Count> {
  int _counter = 0;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  String ramdomEnglish = '';
  Timer? timer;

  @override
  void initState() {
    super.initState();
    _counter = widget.initValue;
    debugPrint("initState");
    countInit();
  }

  @override
  void didUpdateWidget(Count oldWidget) {
    super.didUpdateWidget(oldWidget);
    debugPrint("didUpdateWidget");
  }

  @override
  void deactivate() {
    super.deactivate();
    debugPrint("deactivate");
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
    timer = null;
    debugPrint("dispose");
  }

  @override
  void reassemble() {
    super.reassemble();
    debugPrint("reassemble");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    debugPrint("didChangeDependencies");
  }

  // 初始化缓存的值
  countInit() async {
    int res = await readCounter();
    logger.d('初始count：$res');
    if (res == 0) return;
    setState(() {
      _counter = res;
    });
  }

  // 缓存位置
  Future<File> getLocalFile() async {
    String dir = (await getApplicationDocumentsDirectory()).path;
    return File('$dir/counter.txt');
  }

  // 读取缓存计数器的值
  Future<int> readCounter() async {
    try {
      File file = await getLocalFile();
      String contents = await file.readAsString();
      return int.parse(contents);
    } on FileSystemException {
      return 0;
    }
  }

  // 增加,每次都更新到缓存里
  incrementCounter() {
    setState(() {
      _counter++;
    });

    getLocalFile().then((e) {
      e.writeAsString('$_counter');
    });
  }

  // 打开侧边栏
  openDrawer(ScaffoldState state) {
    ScaffoldState state = context.findAncestorStateOfType<ScaffoldState>()!;
    state.openDrawer();
  }

  // 打开侧边栏
  openDrawerByContext(BuildContext context) {
    ScaffoldState state = context.findAncestorStateOfType<ScaffoldState>()!;
    state.openDrawer();
  }

  // 打开侧边栏
  openDrawerByKey() {
    scaffoldKey.currentState?.openDrawer();
  }

  // 打开SnackBar
  openSnackBar(BuildContext context) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("这里是SnackBar")));
  }

  // 随机生成一个英文
  createRandomEnglish() {
    timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        ramdomEnglish = WordPair.random().toString();
        debugPrint(ramdomEnglish);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("build");
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(title: Text("子树中获取State对象")),
      drawer: Drawer(),
      body: Center(
        child: Column(
          children: [
            Echo(text: 'Increment'),
            Text('you have pushed the button this many times:'),
            Text('$_counter', style: Theme.of(context).textTheme.headlineLarge),

            Builder(
              builder: (context) {
                return ElevatedButton(
                  onPressed: () => openSnackBar(context),
                  child: Text('打开SnackBar'),
                );
              },
            ),

            Builder(
              builder: (context) {
                return ElevatedButton(
                  // onPressed: () => openDrawer(Scaffold.of(context)),
                  // onPressed: () => openDrawerByContext(context),
                  onPressed: () => openDrawerByKey(),
                  // onPressed: () => openSnackBar(context),
                  child: Text('打开抽屉菜单'),
                );
              },
            ),

            TextButton(
              child: Text('open new route'),
              onPressed: () async {
                dynamic res = await Navigator.of(
                  context,
                ).pushNamed("/new_page", arguments: '我是参数');
                if (res) debugPrint(res);
              },
            ),

            // ElevatedButton(onPressed: () {}, child: Text(ramdomEnglish)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
