import 'package:cross_media_recommendation/elements/TodaysPick.dart';
import 'package:flutter/cupertino.dart';

class TitlePage extends StatefulWidget{
  @override
  PageState createState() => PageState();
}

class PageState extends State<TitlePage>{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            TodaysPick(),
          ],
        ),
      ),
    );
  }
}