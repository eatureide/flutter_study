import 'package:flutter/material.dart';

class TapBoxA extends StatefulWidget {
  const TapBoxA({super.key});

  @override
  State<TapBoxA> createState() => _TapBoxA();
}

class _TapBoxA extends State<TapBoxA> {
  bool active = false;

  void handleTap() {
    setState(() {
      active = !active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: handleTap,
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
        child: Center(
          child: Text(
            active ? 'active' : 'inactive',
            style: TextStyle(fontSize: 32, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class TapBoxB extends StatelessWidget {
  const TapBoxB({super.key, required this.active, required this.onChanged});
  final bool active;
  final void Function(bool value) onChanged;

  void handleTap() {
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: handleTap,
      child: Container(
        width: 200,
        height: 200,
        color: active ? Colors.lightGreen[700] : Colors.grey[600],
        child: Text(
          active ? 'Active' : 'Inactive',
          style: TextStyle(fontSize: 32.0, color: Colors.white),
        ),
      ),
    );
  }
}

// 父组件
class ParentWidget extends StatefulWidget {
  const ParentWidget({super.key});

  @override
  State<ParentWidget> createState() => _ParentWidget();
}

class _ParentWidget extends State<ParentWidget> {
  bool active = false;

  handleTapBoxChanged(bool newValue) {
    setState(() {
      active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('state demo')),
      body: TapBoxB(active: active, onChanged: handleTapBoxChanged),
    );
  }
}
