import 'dart:async';

import 'package:flutter/material.dart';
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
      //Navigator.pop(context);
      Navigator.push(
          context,
          PageRouteBuilder(
              transitionDuration: Duration(milliseconds: 400),
              transitionsBuilder: (BuildContext context,
                  Animation<double> animation,
                  Animation<double> secAnimation,
                  Widget child) {
                var begin = Offset(1.0, 0);
                var end = Offset.zero;
                var tween = Tween(begin: begin, end: end);
                var offsetAnimation = animation.drive(tween);
                return SlideTransition(
                  position: offsetAnimation,
                  child: child,
                );
              },
              pageBuilder: (BuildContext context, Animation<double> animation,
                  Animation<double> secAnimation) {
                return HomePage();
              }));
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
            width: size.height / 6,
            height: size.height / 6,
            image: AssetImage("assets/img/splash_icon.png"),
          ),
        ),
      ),
    );
  }
}
