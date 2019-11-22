import 'package:flutter/material.dart';

class LongButton extends StatelessWidget {
  final String text;
  final double horizontalPadding;
  final double verticalPadding;
  final int color;
  final double radius;
  final VoidCallback callback;

  LongButton({
    Key key,
    @required this.text,
    @required this.callback,
    @required this.horizontalPadding,
    this.verticalPadding = 15,
    this.color = 0xFF00B3B9,
    this.radius = 25.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      color: Color(color),
      colorBrightness: Brightness.dark,
      child: Text(
        text,
        style: TextStyle(fontSize: 15),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
      onPressed: callback,
    );
  }
}
