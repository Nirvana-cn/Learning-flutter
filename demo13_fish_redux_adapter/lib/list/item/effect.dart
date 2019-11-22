import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<TestItemState> buildEffect() {
  return combineEffects(<Object, Effect<TestItemState>>{
    TestItemAction.action: _onAction,
    TestItemAction.onRemove: _onRemove,
  });
}

void _onAction(Action action, Context<TestItemState> ctx) {}

void _onRemove(Action action, Context<TestItemState> ctx) {
  ctx.dispatch(TestItemActionCreator.removeItem(action.payload));
}
