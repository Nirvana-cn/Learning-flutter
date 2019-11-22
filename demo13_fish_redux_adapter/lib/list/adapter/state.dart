import 'package:fish_redux/fish_redux.dart';

class ListAdapterState implements Cloneable<ListAdapterState> {

  @override
  ListAdapterState clone() {
    return ListAdapterState();
  }
}

ListAdapterState initState(Map<String, dynamic> args) {
  return ListAdapterState();
}
