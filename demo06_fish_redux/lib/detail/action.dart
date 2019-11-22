import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum DetailAction { increase, update }

class DetailActionCreator {
  static Action onIncrease() {
    return const Action(DetailAction.increase);
  }

  static Action onUpdate(int detailNumber) {
    return const Action(
      DetailAction.update,
    );
  }
}
