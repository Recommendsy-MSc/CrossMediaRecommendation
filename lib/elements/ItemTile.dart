import 'package:cross_media_recommendation/elements/CustomSpacer.dart';
import 'package:cross_media_recommendation/helper/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemTile extends StatefulWidget{
  double parentWidth;
  int index;
  ItemTile({Key? key, required this.parentWidth, required this.index}) : super(key: key);
  @override
  PageState createState() => PageState();
}

class PageState extends State<ItemTile>{

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            // borderRadius: borderRadius12,
            // color: white.withOpacity(0.9),
            // border: testBorder,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                child: ClipRRect(
                  // borderRadius: borderRadius12,
                  child: Image.network(
                    "https://image.tmdb.org/t/p/w185/78lPtwv72eTNqFW9COBYI0dWDJa.jpg",
                    width: widget.parentWidth,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomSpacer(height: 8),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 16,
                        ),
                        Text(
                          " 4 ",
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ],
                    ),
                    SizedBox(height: 4,),
                    Flexible(
                      child: Text(
                        widget.index.toString(),
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Container(
            margin: edgeInsetsAll12,
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: white,
              borderRadius: borderRadius8
            ),
            child: Icon(
              Icons.add,
              color: accentColor,
              size: 20,
            )
          ),
        )
      ],
    );
  }
}