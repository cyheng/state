import 'package:flutter/material.dart';

import '../../model/count.dart';

// 需要其他机制触发重新构建组件树
class CountControllerPage extends StatefulWidget {
  const CountControllerPage({Key? key}) : super(key: key);

  @override
  State<CountControllerPage> createState() => _CountControllerPageState();
}

class _CountControllerPageState extends State<CountControllerPage> {
  CounterController _controller = CounterController();

  @override
  Widget build(BuildContext context) {
    print("Page build");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("contoller Page"),
      ),
      body: Center(child: Counter(controller: _controller)),
      floatingActionButton: IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          // _controller.value = 0;
          _controller.reset();
        },
      ),
    );
  }
}

class Counter extends StatefulWidget {
  final CounterController controller;

  Counter({Key? key, required this.controller}) : super(key: key);

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  @override
  Widget build(BuildContext context) {
    // 套一层 ListenableBuilder 组件
    return ListenableBuilder(
      listenable: widget.controller,
      builder: (BuildContext context, Widget? child) {
        print("Counter build");
        return ElevatedButton(
            onPressed: () {
              widget.controller.value++;
            },
            child: Text("Count:${widget.controller.value}"));
      },
    );
  }
}
