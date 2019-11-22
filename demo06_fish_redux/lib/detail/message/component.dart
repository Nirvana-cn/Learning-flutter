import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class OnlyMessageComponent extends Component<OnlyMessageState> {
  OnlyMessageComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<OnlyMessageState>(
                adapter: null,
                slots: <String, Dependent<OnlyMessageState>>{
                }),);

}
