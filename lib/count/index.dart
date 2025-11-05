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

  @override
  void initState() {
    super.initState();
    _counter = widget.initValue;
    print("initState");
  }

  @override
  void didUpdateWidget(Count oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }

  @override
  void deactivate() {
    super.deactivate();
    print("deactivate");
  }

  @override
  void dispose() {
    super.dispose();
    print("dispose");
  }

  @override
  void reassemble() {
    super.reassemble();
    print("reassemble");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
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

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
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
                  onPressed: () => openDrawer(Scaffold.of(context)),
                  // onPressed: () => openDrawerByContext(context),
                  child: Text('打开抽屉菜单1'),
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
