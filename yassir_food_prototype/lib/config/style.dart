import 'package:flutter/material.dart';

class CustomStyle {
  static Color unselectedTabColor = Color(0xffd6d5d8);
  static Color selectedTabColor = Color(0xffca1333);
  static Color splashBackgroundColor = Color(0xfffcfbfc);
  static Color scaffoldBackgroundColor = Color(0xffe8e8e9);
  static TextStyle tabStyle() {
      return TextStyle(fontSize: 12, fontFamily: "Sofia");}
  static TextStyle appBarStyle() {
      return TextStyle(fontSize: 18, fontFamily: "Sofia",fontWeight: FontWeight.w700,color: Colors.black);}
}
