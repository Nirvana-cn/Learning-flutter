import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';
import 'message/action.dart';

Effect<DetailState> buildEffect() {
  return combineEffects(<Object, Effect<DetailState>>{
    Lifecycle.initState: _init,
    OnlyMessageAction.action : _onAction,
  });
}

void _init(Action action, Context<DetailState> ctx) {
  ctx.dispatch(DetailActionCreator.onUpdate(50));
}

void _onAction(Action action, Context<DetailState> ctx) {
  println("action is happening at parent!");
}
