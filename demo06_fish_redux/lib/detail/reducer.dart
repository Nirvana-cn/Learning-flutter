import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<DetailState> buildReducer() {
  return asReducer(
    <Object, Reducer<DetailState>>{
      DetailAction.increase: _onIncrease,
      DetailAction.update: _onUpdate,
    },
  );
}

DetailState _onIncrease(DetailState state, Action action) {
  final DetailState newState = state.clone();
  newState.detailNumber++;
  return newState;
}

DetailState _onUpdate(DetailState state, Action action) {
  final DetailState newState = state.clone();
  newState.detailNumber = 50;
  return newState;
}
