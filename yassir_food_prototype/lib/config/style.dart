import 'package:flutter/material.dart';

class CustomStyle {
  static Color unselectedTabColor = Color(0xffd6d5d8);
  static Color selectedTabColor = Color(0xffca1333);
  static Color splashBackgroundColor = Color(0xfffcfbfc);
  static Color scaffoldBackgroundColor = Color(0xffe8e8e9);
  static TextStyle tabStyle() {
    return TextStyle(fontSize: 12, fontFamily: "Sofia");
  }

  static TextStyle appBarStyle() {
    return TextStyle(
        fontSize: 18,
        fontFamily: "Sofia",
        fontWeight: FontWeight.w500,
        color: Colors.black);
  }

  static TextStyle contentRedStyle() {
    return TextStyle(
        fontSize: 18,
        fontFamily: "Sofia",
        fontWeight: FontWeight.w700,
        color: selectedTabColor);
  }

  static TextStyle contentStyle() {
    return TextStyle(
        fontSize: 15,
        fontFamily: "Sofia",
        fontWeight: FontWeight.w100,
        color: Color(0xff4a4a4a));
  }

  static TextStyle cardStyleRight() {
    return TextStyle(
        fontSize: 12,
        fontFamily: "Sofia",
        fontWeight: FontWeight.w500,
        color: Colors.white);
  }

  static TextStyle cardStyleLeft() {
    return TextStyle(
        fontSize: 22,
        fontFamily: "Sofia",
        fontWeight: FontWeight.w700,
        color: Colors.white);
  }

  static TextStyle restaurantName() {
    return TextStyle(
        fontSize: 24,
        fontFamily: "Sofia",
        fontWeight: FontWeight.w800,
        color: Colors.black);
  }

  static TextStyle restaurantAdrs() {
    return TextStyle(
        fontSize: 14,
        fontFamily: "Sofia",
        fontWeight: FontWeight.w400,
        color: Color(0xffb5babd));
  }

  static TextStyle restaurantOptions() {
    return TextStyle(
        fontSize: 14,
        fontFamily: "Sofia",
        fontWeight: FontWeight.w700,
        color: Colors.black);
  }

  static TextStyle categoryNameStyle() {
    return TextStyle(
        fontSize: 14,
        fontFamily: "Sofia",
        fontWeight: FontWeight.w400,
        color: Colors.black);
  }

  static TextStyle catNameStyleExtanded() {
    return TextStyle(
      fontSize: 16,
      fontFamily: "Sofia",
      fontWeight: FontWeight.w800,
      color: Colors.white,
    );
  }
  static TextStyle catNameStyleCollapsed() {
    return TextStyle(
      fontSize: 14,
      fontFamily: "Sofia",
      fontWeight: FontWeight.w800,
      color: Colors.black,
    );
  }
  static TextStyle addToCartStyle() {
    return TextStyle(
      fontSize: 12,
      fontFamily: "Sofia",
      fontWeight: FontWeight.w800,
      color: selectedTabColor,
    );
  }
  static TextStyle priceStyle() {
    return TextStyle(
      fontSize: 14,
      fontFamily: "Sofia",
      fontWeight: FontWeight.w800,
      color: Colors.orange,
    );
  }
  static TextStyle foodNameStyle() {
    return TextStyle(
      fontSize: 14,
      fontFamily: "Sofia",
      fontWeight: FontWeight.w800,
      color: Colors.black,
    );
  }
  static TextStyle foodNameAddCartStyle() {
    return TextStyle(
      fontSize: 22,
      fontFamily: "Sofia",
      fontWeight: FontWeight.w800,
      color: Color(0xFFEC0400),
    );
  }
}
