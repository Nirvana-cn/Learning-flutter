import 'package:fish_redux/fish_redux.dart';


class OnlyMessageState implements Cloneable<OnlyMessageState> {
  int currentNumber;

  @override
  OnlyMessageState clone() {
    return OnlyMessageState()..currentNumber = currentNumber;
  }
}

OnlyMessageState initState(Map<String, dynamic> args) {
  return OnlyMessageState();
}

class ComponentLocalProps extends LocalProps<ComponentLocalProps> {
  int localNumber = 10;

  ComponentLocalProps(Context<Object> ctx) : super(ctx);

  factory ComponentLocalProps.of(ExtraData ctx) {
    return LocalProps.provide((_) => ComponentLocalProps(_)).of(ctx);
  }

  @override
  void destructor(Context<Object> ctx) {}
}
