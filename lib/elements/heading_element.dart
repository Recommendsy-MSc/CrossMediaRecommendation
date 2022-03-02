import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeadingElement extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Text(
      "Heading here",
      style: Theme.of(context).textTheme.headline3,
    );
  }
}