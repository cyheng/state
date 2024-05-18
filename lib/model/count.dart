

import 'package:flutter/widgets.dart';
// 贫血模型-> 没有封装
class CounterWrapper {
  int value = 0;

  CounterWrapper(this.value);
}


class CounterController extends ChangeNotifier {
  int _value = 0;

  get value => _value;

  set value(value) {
    _value = value;
    notifyListeners();
  }


  // 添加封装

  void reset(){
    _value = 0;
    notifyListeners();
  }
}

// 等效 CounterController
class CounterValueController {
  ValueNotifier<int> count = ValueNotifier(0);
}