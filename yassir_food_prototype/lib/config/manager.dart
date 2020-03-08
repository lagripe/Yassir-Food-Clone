import 'dart:async';
import 'classes.dart';

class Manager {
  static Future<List<Restaurant>> getRestaurantByLocation(
      List<Restaurant> restaurants, String location) async {
    await Future.delayed(Duration(milliseconds: 500));
    print('-------------- $restaurants.length');
    return restaurants;
  }
}
