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
  final bool active;
  final void Function(bool value) onChanged;
  const TapBoxB({super.key, required this.active, required this.onChanged});

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

class TapBoxC extends StatefulWidget {
  const TapBoxC({super.key, required this.active, required this.onChanged});

  final bool active;
  final void Function(bool vakye) onChanged;

  @override
  State<TapBoxC> createState() => _TapBoxC();
}

class _TapBoxC extends State<TapBoxC> {
  bool highlight = false;

  handleTapDown(TapDownDetails details) {
    setState(() {
      highlight = true;
    });
  }

  handleTapup(TapUpDetails details) {
    setState(() {
      highlight = false;
    });
  }

  handleTapCancel() {
    setState(() {
      highlight = false;
    });
  }

  handleTap() {
    widget.onChanged(!widget.active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: handleTapDown,
      onTapUp: handleTapup,
      onTap: handleTap,
      onTapCancel: handleTapCancel,
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
          border: highlight
              ? Border.all(
                  color: const Color.fromARGB(255, 16, 202, 180),
                  width: 10.0,
                )
              : null,
        ),
        child: Center(
          child: Text(
            widget.active ? 'active' : 'inactive',
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class ParentWidgetC extends StatefulWidget {
  const ParentWidgetC({super.key});

  @override
  State<ParentWidgetC> createState() => _ParentWidgetC();
}

class _ParentWidgetC extends State<ParentWidgetC> {
  bool active = false;
  void handleTapboxChanged(bool newValue) {
    setState(() {
      active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ParentWidgetC')),
      body: TapBoxC(active: active, onChanged: handleTapboxChanged),
    );
  }
}
