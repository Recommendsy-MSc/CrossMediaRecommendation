import 'package:cross_media_recommendation/helper/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GenreDisplay extends StatelessWidget{
  String genre;

  GenreDisplay({Key? key, required this.genre}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: edgeInsetsAll8,
      decoration: BoxDecoration(
        borderRadius: borderRadius20,
        color: primaryTextColor
      ),
      child: Text(
        this.genre,
        style: Theme.of(context).textTheme.headline6!.merge(TextStyle(color: primaryColor)),
      )
    );
  }
}