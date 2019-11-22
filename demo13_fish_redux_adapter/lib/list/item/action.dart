import 'package:fish_redux/fish_redux.dart';

enum TestItemAction { action, updateAge, onRemove, remove }

class TestItemActionCreator {
  static Action onAction() {
    return const Action(TestItemAction.action);
  }

  static Action updateAge(String name) {
    return Action(TestItemAction.updateAge, payload: name);
  }

  static Action onRemoveItem(String name) {
    return Action(TestItemAction.onRemove, payload: name);
  }

  static Action removeItem(String name) {
    return Action(TestItemAction.remove, payload: name);
  }
}
