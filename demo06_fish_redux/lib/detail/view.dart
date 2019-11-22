import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    DetailState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: AppBar(
      title: Text("Detail"),
    ),
    body: Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            viewService.buildComponent("message"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Detail Number: "),
                Text(state.detailNumber.toString()),
              ],
            ),
            RaisedButton(
              child: Text("加1"),
              onPressed: () {
                dispatch(DetailActionCreator.onIncrease());
              },
            )
          ],
        ),
      ),
    ),
  );
}
