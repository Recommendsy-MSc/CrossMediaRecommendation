import 'package:flutter/cupertino.dart';

class CustomSpacer extends StatelessWidget{
  double height;
  double width;

  CustomSpacer({Key? key, this.height = 20, this.width = 20}): super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
    );
  }
}