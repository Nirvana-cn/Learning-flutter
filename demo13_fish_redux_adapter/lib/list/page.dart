import 'package:fish_redux/fish_redux.dart';
import 'adapter/adapter.dart';
import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class TestListPage extends Page<TestListState, Map<String, dynamic>> {
  TestListPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<TestListState>(
            adapter: NoneConn<TestListState>() + ListAdapterAdapter(),
            slots: <String, Dependent<TestListState>>{},
          ),
          middleware: <Middleware<TestListState>>[],
        );
}
