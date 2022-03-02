import 'package:cross_media_recommendation/helper/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatefulWidget{
  ItemCard({Key? key}) : super(key: key);

  @override
  PageState createState() => PageState();
}

class PageState extends State<ItemCard>{
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: edgeInsetsAll20,
      decoration: BoxDecoration(
        borderRadius: borderRadius30,
        color: accentColor.withOpacity(0.1),

      ),
      height: 250,
      width: 444,
      child: Image.network(
        'https://image.tmdb.org/t/p/w1280/cyecB7godJ6kNHGONFjUyVN9OX5.jpg',
        // width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
      )
    );
  }
}