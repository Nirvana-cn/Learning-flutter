import 'package:fish_redux/fish_redux.dart';
import '../state.dart';
import 'reducer.dart';
import '../item/component.dart';
import '../item/state.dart';

class ListAdapterAdapter extends DynamicFlowAdapter<TestListState> {
  ListAdapterAdapter()
      : super(
          pool: <String, Component<Object>>{
            "info": TestItemComponent(),
          },
          connector: _ListAdapterConnector(),
          reducer: buildReducer(),
        );
}

class _ListAdapterConnector extends ConnOp<TestListState, List<ItemBean>> {
  @override
  List<ItemBean> get(TestListState state) {
    if (state.list?.isNotEmpty == true) {
      return state.list.map<ItemBean>((TestItemState data) => ItemBean('info', data)).toList();
    } else {
      return <ItemBean>[];
    }
  }

  @override
  void set(TestListState state, List<ItemBean> items) {
    if (items?.isNotEmpty == true) {
      state.list = List<TestItemState>.from(items.map<TestItemState>((ItemBean bean) => bean.data).toList());
    } else {
      state.list = <TestItemState>[];
    }
  }
}
