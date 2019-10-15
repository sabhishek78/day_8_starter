import 'package:flutter/material.dart';
class RoundButton extends StatelessWidget {
  final Icon icon;
  final Function callback;

  RoundButton({this.icon,this.callback});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: callback,
      child: icon,
      fillColor: Color(0xFF4C5FE),
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(width: 56.0,height: 56.0),
      shape: CircleBorder(),
    );
  }
}