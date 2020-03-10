import 'dart:async';

import 'package:flutter/material.dart';
import 'package:yassir_food_prototype/config/manager.dart';
import 'package:yassir_food_prototype/config/style.dart';

import 'HomePage.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  initState() {
    super.initState();
    Timer(Duration(seconds: 1), () {
      Manager.customPageRoute(context, HomePage(), Offset(1.0, 0.0),
          Offset.zero, Duration(milliseconds: 400));
      //Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: CustomStyle.splashBackgroundColor,
        child: Center(
          child: Image(
            width: size.height / 3,
            height: size.height / 3,
            image: AssetImage("assets/img/splash_icon.png"),
          ),
        ),
      ),
    );
  }
}
