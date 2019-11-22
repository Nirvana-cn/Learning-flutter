import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<OnlyMessageState> buildReducer() {
  return asReducer(
    <Object, Reducer<OnlyMessageState>>{
      OnlyMessageAction.action: _onAction,
      OnlyMessageAction.updateView: _updateView,
      OnlyMessageAction.updateCurrentNumber: _updateCurrentNumber,
    },
  );
}

OnlyMessageState _onAction(OnlyMessageState state, Action action) {
  final OnlyMessageState newState = state.clone();
  return newState;
}

OnlyMessageState _updateView(OnlyMessageState state, Action action) {
  final OnlyMessageState newState = state.clone();
  return newState;
}

OnlyMessageState _updateCurrentNumber(OnlyMessageState state, Action action) {
  println("update");
  final OnlyMessageState newState = state.clone()..currentNumber += 1;
  return newState;
}
