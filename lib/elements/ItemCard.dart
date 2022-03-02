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
      height: 400,
      width: MediaQuery.of(context).size.width * 0.62,
      // height: 400,
      decoration: BoxDecoration(
        // border: testBorder,
        image: DecorationImage(
          image: NetworkImage(
            'https://image.tmdb.org/t/p/w1280/cyecB7godJ6kNHGONFjUyVN9OX5.jpg',
          ),
          fit: BoxFit.fill
        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Iron Man",
            style: Theme.of(context).textTheme.headline2,
          )
        ],
      ),
    );
  }
}