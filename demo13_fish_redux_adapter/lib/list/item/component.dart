import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'state.dart';
import 'view.dart';
import 'reducer.dart';

class TestItemComponent extends Component<TestItemState> {
  TestItemComponent()
      : super(
          view: buildView,
          reducer: buildReducer(),
          effect: buildEffect(),
          dependencies: Dependencies<TestItemState>(adapter: null, slots: <String, Dependent<TestItemState>>{}),
        );
}
