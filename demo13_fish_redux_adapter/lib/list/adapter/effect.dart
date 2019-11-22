import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<ListAdapterState> buildEffect() {
  return combineEffects(<Object, Effect<ListAdapterState>>{
    ListAdapterAction.action: _onAction,
  });
}

void _onAction(Action action, Context<ListAdapterState> ctx) {
}
