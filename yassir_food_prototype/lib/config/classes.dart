import 'package:flutter/material.dart';

class Food {
  String idFood, nameFood;
  double price;
  Food({@required this.idFood, @required this.nameFood, @required this.price});
}

class Category {
  String idCat, nameCat, banner;
  List<Food> food;
  Category(
      {@required this.idCat,
      @required this.nameCat,
      @required this.banner,
      @required this.food});
}

class Restaurant {
  String idRestaurant, nameRestaurant, banner, adrs, close_at, delivers_in;
  double rating;
  bool isOpen;
  List<Category> menu;

  Restaurant(
      {this.idRestaurant,
      this.nameRestaurant,
      this.banner,
      this.adrs,
      this.rating,
      this.isOpen,
      this.menu,
      this.close_at,
      this.delivers_in});
}

class Order {
  Food food;
  int quantity;
  Order({@required this.food, @required this.quantity});
}

class Cart {
  Restaurant restaurant;
  List<Order> orders = List<Order>();
  Cart({@required this.restaurant, @required this.orders});
}

class MyAccountItem {
  String iconPath, header;
  Widget clickable;
  IconData replacement;
  bool colored = false;
  Widget callback;
  MyAccountItem(
      {@required this.iconPath,
      @required this.header,
      @required this.clickable,
      @required this.replacement,
      @required this.colored,
      @required this.callback
      });
}
