import 'package:flutter/material.dart';
import 'package:yassir_food_prototype/pages/SplashScreen.dart';

void main() => runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      accentColor: Colors.red[900],
        appBarTheme: AppBarTheme(color: Color(0xfffcfbfc), elevation: 2)),
    home: SplashScreen()));
