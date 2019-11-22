import 'package:fish_redux/fish_redux.dart';
import 'item/state.dart';

class TestListState implements Cloneable<TestListState> {
  List<TestItemState> list;

  @override
  TestListState clone() {
    return TestListState()..list = list;
  }
}

TestListState initState(Map<String, dynamic> args) {
  TestListState state = TestListState();
  state.list = [];
  TestItemState item1 = TestItemState()
    ..name = "AAA"
    ..age = 20;
  state.list.add(item1);
  TestItemState item2 = TestItemState()
    ..name = "BBB"
    ..age = 30;
  state.list.add(item2);
  TestItemState item3 = TestItemState()
    ..name = "CCC"
    ..age = 50;
  state.list.add(item3);
  return state;
}
