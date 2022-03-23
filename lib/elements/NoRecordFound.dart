import 'package:cross_media_recommendation/helper/constants.dart';
import 'package:flutter/cupertino.dart';

class NoRecordsFound extends StatelessWidget{
  String? title;

  NoRecordsFound({this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title ?? "No Results",
      style: TextStyle(
        color: primaryTextColor.withOpacity(0.9),
        fontSize: 16,
      ),
    );
  }
}