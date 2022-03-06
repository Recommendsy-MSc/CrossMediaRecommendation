import 'package:cross_media_recommendation/elements/CustomSpacer.dart';
import 'package:cross_media_recommendation/elements/KeywordDisplay.dart';
import 'package:cross_media_recommendation/helper/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TitleDetails extends StatefulWidget{
  @override
  PageState createState() => PageState();
}

class PageState extends State<TitleDetails>{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            child: Image.network(
              "https://image.tmdb.org/t/p/w342/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg",
              width: 250,
              height: 513*250/342,
            ),
          ),
          Expanded(
              child: Container(
                height: 513*250/342,
                // decoration: testDec,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Iron Man",
                                style: Theme.of(context).textTheme.headline2,
                              ),
                              CustomSpacer(height: 8,),
                              Row(
                                children: [
                                  Icon(
                                    Icons.date_range,
                                    color: primaryTextColor,
                                  ),
                                  CustomSpacer(width: 8,),

                                  Text(
                                    "12/17/2021",
                                    style: Theme.of(context).textTheme.headline5,

                                  ),
                                  CustomSpacer(width: 12,),
                                  Icon(
                                    Icons.access_time,
                                    color: primaryTextColor,
                                  ),
                                  CustomSpacer(width: 4,),
                                  Text(
                                    "2h 02min",
                                    style: Theme.of(context).textTheme.headline5,

                                  )
                                ],
                              )

                            ],
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "A Disgrace to Criminals Everywhere.",
                      style: Theme.of(context).textTheme.headline4,

                    ),
                    Text(
                      "After /being held captive in an Afghan cave, billionaire engineer Tony Stark creates a unique weaponized suit of armor to fight evil. After /being held captive in an Afghan cave, billionaire engineer Tony Stark creates a unique weaponized suit of armor to fight evil.",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    Text(
                      "Cast: Tom Holland, Robert Downey Jr, Henry Cavil",
                      style: Theme.of(context).textTheme.headline4,

                    ),
                    Flexible(
                      child: Wrap(
                        children: [
                          KeywordDisplay(keyword: "Horror"),
                          CustomSpacer(width: 10,),
                          KeywordDisplay(keyword: "Thrill"),
                          CustomSpacer(width: 10,),
                          KeywordDisplay(keyword: "Suspense"),
                          CustomSpacer(width: 10,),
                          KeywordDisplay(keyword: "Horror"),
                        ],
                      ),
                    )
                  ],
                ),
              )
          ),
        ],
      )
    );
  }
}