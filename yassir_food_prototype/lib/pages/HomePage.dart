import 'package:flutter/material.dart';
import 'package:yassir_food_prototype/components/CustomAppBars.dart';
import 'package:yassir_food_prototype/components/CustomTab.dart';
import 'package:yassir_food_prototype/config/classes.dart';
import 'package:yassir_food_prototype/config/style.dart';
import 'package:yassir_food_prototype/components/MaklaTabViewItem.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  TextEditingController _controller;
  int _currentIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TextEditingController();
    _tabController = TabController(length: 4, initialIndex: 0, vsync: this);
    _tabController.addListener(
        () => setState(() => _currentIndex = _tabController.index));

  }

  @override
  Widget build(BuildContext context) {
    List<Food> food = [
      Food(nameFood: "Barquette de frites",price: "150.00"),
      Food(nameFood: "Assiete de frites",price: "200.00"),
      Food(nameFood: "Pizza poulé",price: "600.00"),
      Food(nameFood: "Pizza Mega",price: "1800.00"),
      Food(nameFood: "Barquette de frites",price: "150.00"),
      Food(nameFood: "Assiete de frites",price: "200.00"),
      Food(nameFood: "Pizza poulé",price: "600.00"),
      Food(nameFood: "Pizza Mega",price: "1800.00"),
      Food(nameFood: "Barquette de frites",price: "150.00"),
      Food(nameFood: "Assiete de frites",price: "200.00"),
      Food(nameFood: "Pizza poulé",price: "600.00"),
      Food(nameFood: "Pizza Mega",price: "1800.00"),
    ];
     List<Category> menu = [
      Category(banner: "https://glasrestaurant.ie/assets/img/Glas_restaurant_food_01.jpg?v2",food: food,nameCat: "Desserts",idCat: ""),
      Category(banner: "http://www.gorwelion.co.uk/wp-content/uploads/2015/07/fine-dining-01.jpg",food: food,nameCat: "Entrées chaudes",idCat: ""),
      Category(banner: "https://st4.depositphotos.com/1959135/22184/i/1600/depositphotos_221844198-stock-photo-grilled-chicken-legs-tomato-sauce.jpg",food: food,nameCat: "Entrées froids",idCat: ""),
      Category(banner: "https://cdn.pixabay.com/photo/2017/12/09/08/18/pizza-3007395_960_720.jpg",food: food,nameCat: "Pizza",idCat: ""),
      Category(banner: "http://www.gorwelion.co.uk/wp-content/uploads/2015/07/fine-dining-01.jpg",food: food,nameCat: "Plats",idCat: ""),
      Category(banner: "https://media.timeout.com/images/105326979/750/422/image.jpg",food: food,nameCat: "Pâtes",idCat: ""),
      Category(banner: "https://glasrestaurant.ie/assets/img/Glas_restaurant_food_01.jpg?v2",food: food,nameCat: "Desserts",idCat: ""),
      Category(banner: "http://www.gorwelion.co.uk/wp-content/uploads/2015/07/fine-dining-01.jpg",food: food,nameCat: "Entrées chaudes",idCat: ""),
      Category(banner: "https://st4.depositphotos.com/1959135/22184/i/1600/depositphotos_221844198-stock-photo-grilled-chicken-legs-tomato-sauce.jpg",food: [],nameCat: "Entrées froids",idCat: ""),
      Category(banner: "https://cdn.pixabay.com/photo/2017/12/09/08/18/pizza-3007395_960_720.jpg",food: food,nameCat: "Pizza",idCat: ""),
      Category(banner: "http://www.gorwelion.co.uk/wp-content/uploads/2015/07/fine-dining-01.jpg",food: food,nameCat: "Plats",idCat: ""),
      Category(banner: "https://media.timeout.com/images/105326979/750/422/image.jpg",food: food,nameCat: "Pâtes",idCat: ""),
    ];
    List<Restaurant> restaurants = [
      Restaurant(adrs: "Staouali, Algérie",banner: "https://st4.depositphotos.com/1959135/22184/i/1600/depositphotos_221844198-stock-photo-grilled-chicken-legs-tomato-sauce.jpg",idRestaurant: "",nameRestaurant: "La Famillie",rating: 4.5,isOpen: true,close_at: "22:00",delivers_in: "40-45 Mins",menu: menu),
      Restaurant(adrs: "Bab Ezzouar, Algérie",banner: "http://www.gorwelion.co.uk/wp-content/uploads/2015/07/fine-dining-01.jpg",idRestaurant: "",nameRestaurant: "Savanah",rating: 5.0,isOpen: true,close_at: "22:00",delivers_in: "40-45 Mins",menu: menu),
      Restaurant(adrs: "El Biar, Algérie",banner: "https://cdn.pixabay.com/photo/2017/12/09/08/18/pizza-3007395_960_720.jpg",idRestaurant: "",nameRestaurant: "Casa Alger",rating: 3.7,isOpen: false,close_at: "22:00",delivers_in: "40-45 Mins",menu: menu),
      Restaurant(adrs: "Bab El Oued, Algérie",banner: "https://media.timeout.com/images/105326979/750/422/image.jpg",idRestaurant: "",nameRestaurant: "Manhattan",rating: 2.6,isOpen: false,close_at: "22:00",delivers_in: "40-45 Mins",menu: menu),
      Restaurant(adrs: "Kouba, Algérie",banner: "https://glasrestaurant.ie/assets/img/Glas_restaurant_food_01.jpg?v2",idRestaurant: "",nameRestaurant: "Café Store",rating: 1.0,isOpen: true,close_at: "22:00",delivers_in: "40-45 Mins",menu: menu),
      Restaurant(adrs: "Alger Centre, Algérie",banner: "https://cdn.pixabay.com/photo/2014/05/18/11/25/pizza-346985_960_720.jpg",idRestaurant: "",nameRestaurant: "Savanah",rating: 1.8,isOpen: true,close_at: "22:00",delivers_in: "40-45 Mins",menu: menu),
      Restaurant(adrs: "Boulevard du 11 Decembre 1960, El Biar, Algérie",banner: "https://cdn.pixabay.com/photo/2017/12/09/08/18/pizza-3007395_960_720.jpg",idRestaurant: "",nameRestaurant: "Pizza Time val d'hydra",rating: 1.8,isOpen: true,close_at: "22:00",delivers_in: "40-45 Mins",menu: menu),
    ];
   
    return Scaffold(
      appBar: _currentIndex == 0
          ? CustomAppBars.maklaAppBar("header", "location")
          : _currentIndex == 1
              ? CustomAppBars.exploreAppBar(_controller)
              : _currentIndex == 2
                  ? CustomAppBars.simpleAppBar("Cart")
                  : CustomAppBars.simpleAppBar("My account"),
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: _tabController, children: [
        MaklaTabViewItem(restaurants: restaurants,location: "",),
        Container(
          color: CustomStyle.scaffoldBackgroundColor,
          child: Center(child: Text("Search for restaurants or dishes.",style: CustomStyle.restaurantAdrs(),),),
        ),
        Container(
          color: CustomStyle.scaffoldBackgroundColor,
        ),
        Container(
          color: CustomStyle.scaffoldBackgroundColor,
        ),
      ]),
      bottomNavigationBar: TabBar(
          unselectedLabelColor: CustomStyle.unselectedTabColor,
          labelColor: CustomStyle.selectedTabColor,
          indicatorColor: Colors.transparent,
          controller: _tabController,
          tabs: [
            CustomTab(
              title: "MAKLA",
              icon: "assets/img/makla.png",
            ),
            CustomTab(
              title: "Explore",
              icon: "assets/img/explore.png",
            ),
            CustomTab(
              title: "Cart",
              icon: "assets/img/cart.png",
            ),
            CustomTab(
              title: "Account",
              icon: "assets/img/account.png",
            ),
          ]),
    );
  }
}
