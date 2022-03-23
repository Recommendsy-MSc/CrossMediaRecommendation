import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Loading extends StatelessWidget{
  Color? color;

  Loading({this.color});
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: Center(child: SizedBox(width: 40, height: 40, child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(color!),
          strokeWidth: 2,
        )))
    );
  }
}