import 'package:cross_media_recommendation/elements/SearchBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TopNavSearchPage extends StatefulWidget{
  TopNavSearchPage({Key? key,}) : super(key: key);

  @override
  PageState createState () => PageState();
}



class PageState extends State<TopNavSearchPage>{
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      // decoration: testDec,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: (){
              Navigator.of(context).pushNamedAndRemoveUntil('/HomePage', (route) => false);
            },
            child: Text(
              "CRM",
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          // CustomSpacer(width: 30,),

          SearchBarCustom(),
        ],
      ),
    );
  }
}