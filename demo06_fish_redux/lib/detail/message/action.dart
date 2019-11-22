import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum OnlyMessageAction { action, updateLocalNumber, updateView, updateCurrentNumber }

class OnlyMessageActionCreator {
  static Action onAction() {
    return const Action(OnlyMessageAction.action);
  }

  static Action onUpdateLocalNumber() {
    return const Action(OnlyMessageAction.updateLocalNumber);
  }

  static Action updateCurrentNumber() {
    return const Action(OnlyMessageAction.updateCurrentNumber);
  }

  static Action onUpdateView() {
    return const Action(OnlyMessageAction.updateView);
  }
}
