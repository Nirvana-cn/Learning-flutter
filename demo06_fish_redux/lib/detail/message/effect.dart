import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<OnlyMessageState> buildEffect() {
  return combineEffects(<Object, Effect<OnlyMessageState>>{
    OnlyMessageAction.action: _onAction,
    OnlyMessageAction.updateLocalNumber: _updateLocalNumber,
  });
}

bool _onAction(Action action, Context<OnlyMessageState> ctx) {
  println("action is happening!");
  return false;
}

void _updateLocalNumber(Action action, Context<OnlyMessageState> ctx) {
  ComponentLocalProps.of(ctx).localNumber += 10;
  println("${ComponentLocalProps.of(ctx).localNumber}");
  ctx.dispatch(OnlyMessageActionCreator.onUpdateView());
}
