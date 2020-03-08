import 'dart:async';
import 'classes.dart';
import 'package:flutter/material.dart';
class Manager {
  static Future<List<Restaurant>> getRestaurantByLocation(
      List<Restaurant> restaurants, String location) async {
    await Future.delayed(Duration(milliseconds: 500));
    print('-------------- $restaurants.length');
    return restaurants;
  }
  static customPageRoute(BuildContext context,Widget widget,Offset begin,Offset end,Duration duration){
    Navigator.push(
          context,
          PageRouteBuilder(
              transitionDuration: duration,
              transitionsBuilder: (BuildContext context,
                  Animation<double> animation,
                  Animation<double> secAnimation,
                  Widget child) {
                var tween = Tween(begin: begin, end: end);
                var offsetAnimation = animation.drive(tween);
                return SlideTransition(
                  position: offsetAnimation,
                  child: child,
                );
              },
              pageBuilder: (BuildContext context, Animation<double> animation,
                  Animation<double> secAnimation) {
                return widget;
              }));
  }
}
