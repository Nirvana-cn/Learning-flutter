import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'state.dart';
import 'action.dart';

Widget buildView(OnlyMessageState state, Dispatch dispatch, ViewService viewService) {
  return Column(
    children: <Widget>[
      Text("The detail number now is: ${state.currentNumber} ."),
      InkWell(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "The local number now is: ${ComponentLocalProps.of(viewService).localNumber} .",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        onTap: () {
          dispatch(OnlyMessageActionCreator.updateCurrentNumber());
        },
        onLongPress: (){
          dispatch(OnlyMessageActionCreator.onAction());
        },
      ),
    ],
  );
}
