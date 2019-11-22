import 'package:fish_redux/fish_redux.dart';

import '../state.dart';
import '../item/state.dart';
import '../item/action.dart';

Reducer<TestListState> buildReducer() {
  return asReducer(
    <Object, Reducer<TestListState>>{
      TestItemAction.remove: _remove,
    },
  );
}

TestListState _remove(TestListState state, Action action) {
  final String unique = action.payload;
  final TestListState newState = state.clone();
  newState.list.removeWhere((TestItemState state) => state.name == unique);
  return newState;
}
