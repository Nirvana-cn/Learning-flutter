import 'package:fish_redux/fish_redux.dart';
import 'message/state.dart';

class DetailState implements Cloneable<DetailState> {
  int detailNumber;

  @override
  DetailState clone() {
    return DetailState()..detailNumber = detailNumber;
  }
}

DetailState initState(Map<String, dynamic> args) {
  final DetailState state = DetailState();
  state.detailNumber = 0;
  return state;
}

class OnlyMessageConnector extends Reselect1<DetailState, OnlyMessageState, int> {
  @override
  OnlyMessageState computed(int sub0) {
    return OnlyMessageState()..currentNumber = sub0;
  }

  @override
  int getSub0(DetailState state) {
    return state.detailNumber;
  }

  @override
  void set(DetailState state, OnlyMessageState subState) {
    state.detailNumber = subState.currentNumber;
  }
}

