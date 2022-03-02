import 'package:cross_media_recommendation/elements/CustomSpacer.dart';
import 'package:cross_media_recommendation/elements/KeywordDisplay.dart';
import 'package:cross_media_recommendation/helper/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TodaysPick extends StatefulWidget{
  TodaysPick({Key? key}) : super(key: key);

  @override
  PageState createState() => PageState();
}

class PageState extends State<TodaysPick>{
  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: testDec,
      child: Row(
        children: [
          Container(
            // margin: edgeInsetsAll20,
              decoration: BoxDecoration(
                  borderRadius: borderRadius12,
                  color: accentColor.withOpacity(0.1),
                image: DecorationImage(
                  image: NetworkImage(
                      'https://image.tmdb.org/t/p/w1280/cyecB7godJ6kNHGONFjUyVN9OX5.jpg',

                  ),
                  colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.9), BlendMode.dstATop),
                )
              ),
              height: 250,
              width: 444,
              // child: Image.network(
              //   'https://image.tmdb.org/t/p/w1280/cyecB7godJ6kNHGONFjUyVN9OX5.jpg',
              //   // width: MediaQuery.of(context).size.width,
              //   fit: BoxFit.cover,
              // )
          ),
          CustomSpacer(width: 20,),
          Expanded(
              child: Container(
                height: 250,
                // decoration: testDec,
                // padding: edgeInsetsAll20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            "Lord of The Rings - Fellowship of the Ring",
                            style: Theme.of(context).textTheme.headline2,
                          ),
                        ),
                        CustomSpacer(width: 8,),
                        OutlinedButton(
                          onPressed: null,
                          style: OutlinedButton.styleFrom(
                            backgroundColor: accentColor,
                            shape: RoundedRectangleBorder(borderRadius: borderRadius8),
                            padding: edgeInsetsAll20,
                          ),
                          child: Text(
                            "+ Add to List",
                            style: TextStyle(
                                color: primaryTextColor
                            ),
                          )
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                            "After /being held captive in an Afghan cave, billionaire engineer Tony Stark creates a unique weaponized suit of armor to fight evil.",
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        CustomSpacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Wrap(
                                // spacing: 20,
                                children: [
                                  Container(
                                      child: KeywordDisplay(keyword: "Horror"),
                                    margin: edgeInsetsAll4,
                                  ),
                                  // CustomSpacer(width: 10, height: 10,),
                                  Container(
                                    child: KeywordDisplay(keyword: "Horror"),
                                    margin: edgeInsetsAll4,
                                  ),
                                  Container(
                                    child: KeywordDisplay(keyword: "Horror"),
                                    margin: edgeInsetsAll4,
                                  ),
                                  Container(
                                    child: KeywordDisplay(keyword: "Horror"),
                                    margin: edgeInsetsAll4,
                                  ),


                                ],
                              ),
                            ),
                            Text(
                              "View Similar >>",
                              style: TextStyle(
                                color: accentColor.withOpacity(0.8),
                                fontSize: 14
                              ),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              )
          ),
        ],
      ),
    );
  }
}