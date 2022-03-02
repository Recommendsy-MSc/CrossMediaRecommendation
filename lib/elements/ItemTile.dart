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
          padding: edgeInsetsAll8,
          decoration: BoxDecoration(
            borderRadius: borderRadius12,
            color: white.withOpacity(0.9)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                child: ClipRRect(
                  borderRadius: borderRadius12,
                  child: Image.network(
                    "https://image.tmdb.org/t/p/w185/78lPtwv72eTNqFW9COBYI0dWDJa.jpg",
                    width: widget.parentWidth - 16
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  // border: testBorder,
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                          decoration: BoxDecoration(
                            borderRadius: borderRadius4,
                            border: testBorder
                          ),
                          child: Row(
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
                        ),
                        SizedBox(height: 4,),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 4),
                          child: Text(
                            widget.index.toString()
                          ),
                        ),
                      ],
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
            margin: edgeInsetsAll20,
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