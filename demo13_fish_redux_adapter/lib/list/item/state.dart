import 'package:fish_redux/fish_redux.dart';

class TestItemState implements Cloneable<TestItemState> {
  String name;
  int age;

  @override
  TestItemState clone() {
    return TestItemState()
      ..name = name
      ..age = age;
  }
}

TestItemState initState(Map<String, dynamic> args) {
  return TestItemState();
}
