import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeadingElement extends StatelessWidget{
  String title;
  HeadingElement({Key? key, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      title.toString(),
      style: Theme.of(context).textTheme.headline3,
    );
  }
}