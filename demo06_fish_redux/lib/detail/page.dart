import 'package:fish_redux/fish_redux.dart';

import 'reducer.dart';
import 'state.dart';
import 'view.dart';
import 'effect.dart';
import 'message/component.dart';

class DetailPage extends Page<DetailState, Map<String, dynamic>> {
  DetailPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<DetailState>(
            adapter: null,
            slots: <String, Dependent<DetailState>>{
              "message": OnlyMessageConnector() + OnlyMessageComponent(),
            },
          ),
          middleware: <Middleware<DetailState>>[],
        );
}
