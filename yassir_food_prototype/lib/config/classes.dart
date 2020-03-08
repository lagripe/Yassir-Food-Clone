import 'package:flutter/material.dart';

class Food {
  String nameFood, price;
  Food({@required this.nameFood, @required this.price});
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
  String idRestaurant, nameRestaurant, banner, adrs, close_at,delivers_in;
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
