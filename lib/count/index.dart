import 'package:flutter/material.dart';

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
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Count(),
    );
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
  // final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _counter = widget.initValue;
    debugPrint("initState");
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

  _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  openDrawer(ScaffoldState state) {
    ScaffoldState state = context.findAncestorStateOfType<ScaffoldState>()!;
    state.openDrawer();
  }

  openDrawerByContext(BuildContext context) {
    ScaffoldState state = context.findAncestorStateOfType<ScaffoldState>()!;
    state.openDrawer();
  }

  openDrawerByKey() {
    scaffoldKey.currentState?.openDrawer();
  }

  openSnackBar(BuildContext context) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("这里是SnackBar")));
  }

  @override
  Widget build(BuildContext context) {
    print("build");
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
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
