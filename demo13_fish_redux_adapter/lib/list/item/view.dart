import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'state.dart';
import 'action.dart';

Widget buildView(TestItemState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
    color: Colors.grey,
    child: InkWell(
      onTap: () {
        dispatch(TestItemActionCreator.updateAge(state.name));
      },
      onLongPress: () {
        dispatch(TestItemActionCreator.onRemoveItem(state.name));
      },
      child: Column(
        children: <Widget>[
          Text(
            "用户名： ${state.name}",
            style: TextStyle(color: Colors.white),
          ),
          Text("年 龄： ${state.age.toString()}"),
        ],
      ),
    ),
  );
}
