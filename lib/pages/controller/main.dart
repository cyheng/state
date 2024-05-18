import 'package:flutter/material.dart';

import 'callback.dart';
import 'controller.dart';



class ControllerPage extends StatefulWidget {
  const ControllerPage({Key? key}) : super(key: key);

  @override
  State<ControllerPage> createState() => _ControllerPageState();
}

// TODO: 如何实现父控制子？
class _ControllerPageState extends State<ControllerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("controller main Page"),
      ),
      body: Center(child: Counter()),
      persistentFooterButtons: [
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const CallbackPage()));
            },
            child: Text("通过 callback 实现")),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const CountControllerPage()));
            },
            child: Text("通过 controller 实现")),
      ],
      floatingActionButton: IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          // _count = 0;
        },
      ),
    );
  }
}

class Counter extends StatefulWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          setState(() {
            _count++;
          });
        },
        child: Text("Count:$_count"));
  }
}




