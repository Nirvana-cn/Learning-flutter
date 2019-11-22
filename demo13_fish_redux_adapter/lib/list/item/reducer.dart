import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<TestItemState> buildReducer() {
  return asReducer(
    <Object, Reducer<TestItemState>>{
      TestItemAction.action: _onAction,
      TestItemAction.updateAge: _updateAge,
    },
  );
}

TestItemState _onAction(TestItemState state, Action action) {
  final TestItemState newState = state.clone();
  return newState;
}

TestItemState _updateAge(TestItemState state, Action action) {
  if (state.name == action.payload) {
    return state.clone()..age = ++state.age;
  }
  return state;
}
