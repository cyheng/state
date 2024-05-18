

import 'package:flutter/material.dart';

import '../../model/count.dart';

/// 可以实现，但是有
/// 1. 无法直接修改，因为传值 -> 包一层 class
/// 2. 代码要完全自己掌控，子的状态传给了父
/// 3. 点击清空按钮 setState 导致父组件重绘
///
///
class CallbackPage extends StatefulWidget {
  const CallbackPage({Key? key}) : super(key: key);

  @override
  State<CallbackPage> createState() => _CallbackPageState();
}

class _CallbackPageState extends State<CallbackPage> {
  CounterWrapper wrapper = CounterWrapper(0);

  @override
  Widget build(BuildContext context) {
    print("Page build");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("callback Page"),
      ),
      body: Center(
          child: Counter(
              count: wrapper
          )),
      floatingActionButton: IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          setState(() {
            wrapper.value = 0;
          });
        },
      ),
    );
  }
}

class Counter extends StatefulWidget {
  CounterWrapper count;

  void Function()? callBack;

  Counter({Key? key, required this.count,   this.callBack})
      : super(key: key);

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  @override
  Widget build(BuildContext context) {
    print("Counter build");
    return ElevatedButton(
        onPressed: () {
          setState(() {
            widget.count.value++;
          });
          if(widget.callBack!=null){
            widget.callBack!();
          }

        },
        child: Text("Count:${widget.count.value}"));
  }
}