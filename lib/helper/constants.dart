import 'package:flutter/material.dart';

const String tmdb_image_url = 'https://image.tmdb.org/t/p/';
const String poster_size_185 = 'w185';
const String poster_size_342 = 'w342';
const String poster_size_500 = 'w500';


const List<String> mediaType = [
  "Movie",
  'TV',
  'Book',
  'Game'
];


Border testBorder = Border.all(color: Colors.red);
BoxDecoration testDec = BoxDecoration(
  border: testBorder
);

BorderRadius borderRadius4 = BorderRadius.circular(4);
BorderRadius borderRadius8 = BorderRadius.circular(8);
BorderRadius borderRadius12 = BorderRadius.circular(12);
BorderRadius borderRadius20 = BorderRadius.circular(20);
BorderRadius borderRadius30 = BorderRadius.circular(30);

Radius radius12 = Radius.circular(12);
Radius radius20 = Radius.circular(20);
Radius radius30 = Radius.circular(30);

EdgeInsets edgeInsetsAll20 = EdgeInsets.all(20);
EdgeInsets edgeInsetsAll32 = EdgeInsets.all(32);
EdgeInsets edgeInsetsAll8 = EdgeInsets.all(8);
EdgeInsets edgeInsetsAll4 = EdgeInsets.all(4);
EdgeInsets edgeInsetsAll12 = EdgeInsets.all(12);


// Color primaryColor = Color(0xFFE3E4F5);
Color primaryColor = Color(0xFF181D23);
// Color accentColor = Color(0xFF191A1F);
// Color accentColor = Color(0xFF6AD8B7);
Color accentColor = Color(0xFFF86D4E);
// Color primaryTextColor = Color(0xFFF5F5F6);
Color primaryTextColor = Color(0xFFFFFFFF);
Color accentTextColor = Color(0xFFF5F5F5);
Color white = Colors.white;