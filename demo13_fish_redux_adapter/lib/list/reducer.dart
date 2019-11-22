import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<TestListState> buildReducer() {
  return asReducer(
    <Object, Reducer<TestListState>>{
      TestListAction.action: _onAction,
    },
  );
}

TestListState _onAction(TestListState state, Action action) {
  final TestListState newState = state.clone();
  return newState;
}
