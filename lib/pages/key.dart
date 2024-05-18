import 'package:flutter/material.dart';


class KeyPage extends StatefulWidget {
  const KeyPage({super.key});

  @override
  State<KeyPage> createState() => _KeyPageState();
}

class _KeyPageState extends State<KeyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Key Page"),
      ),
      body: const Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Box(color: Colors.blue),
                Box(color: Colors.red),
                Box(color: Colors.green),
              ],
            ),
            SizedBox(width: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NumberBox(color: Colors.blue),
                NumberBox(color: Colors.green),
                NumberBox(color: Colors.red),
              ],
            ),
            SizedBox(width: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NumberBox(key: ValueKey(1), color: Colors.blue),
                NumberBox(key: ValueKey(2), color: Colors.red),
                NumberBox(key: ValueKey(3), color: Colors.green),
                // 当然还有 ObjectKey , UniqueKey ,GlobalKey 就不细说了
              ],
            ),
            SizedBox(width: 20),
          ],
        ),
      ),
    );
  }
}


class Box extends StatelessWidget {
  const Box({super.key, required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      width: 100,
      height: 100,
    );
  }
}

class NumberBox extends StatefulWidget {
  const NumberBox({super.key, required this.color});

  final Color color;

  @override
  State<NumberBox> createState() => _NumberBoxState();
}

class _NumberBoxState extends State<NumberBox> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: widget.color,
        width: 100,
        height: 100,
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              _count++;
            });
          },
          child: Text('$_count'),
        ));
  }
}