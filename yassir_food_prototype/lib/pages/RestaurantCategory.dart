import 'package:yassir_food_prototype/config/classes.dart';
import 'package:flutter/material.dart';
import 'package:yassir_food_prototype/config/style.dart';

class RestaurantCategory extends StatefulWidget {
  Restaurant restaurant;
  int index_cat;
  RestaurantCategory({@required this.restaurant, @required this.index_cat});
  @override
  _RestaurantCategoryState createState() =>
      _RestaurantCategoryState(restaurant: restaurant, index_cat: index_cat);
}

class _RestaurantCategoryState extends State<RestaurantCategory> {
  Restaurant restaurant;
  int index_cat;
  ScrollController _controller;
  bool _isCollapsed = false;

  _RestaurantCategoryState(
      {@required this.restaurant, @required this.index_cat});
  bool get _isAppBarExpanded {
    print(_controller.hasClients &&
        _controller.offset >
            ((MediaQuery.of(context).size.height / 3.7) - kToolbarHeight));
    return _controller.hasClients &&
        _controller.offset >
            ((MediaQuery.of(context).size.height / 3.7) - kToolbarHeight);
  }

  @override
  void initState() {
    super.initState();
    _controller = ScrollController()
      ..addListener(() => _isAppBarExpanded
          ? setState(() => _isCollapsed = _isAppBarExpanded)
          : setState(() => _isCollapsed = _isAppBarExpanded));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(index_cat);
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        controller: _controller,
        slivers: <Widget>[
          SliverAppBar(
              leading: InkWell(
                onTap: ()=>Navigator.pop(context),
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 25,
                  color: _isCollapsed ? Colors.black : Colors.white,
                ),
              ),
              pinned: true,
              floating: false,
              expandedHeight: MediaQuery.of(context).size.height / 3.7,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                titlePadding: EdgeInsets.zero,
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Flexible(child: Container(), flex: 3),
                    Flexible(
                        child: Text(
                          restaurant.menu[index_cat].nameCat,
                          style: _isCollapsed
                              ? CustomStyle.catNameStyleCollapsed()
                              : CustomStyle.catNameStyleExtanded(),
                          textAlign: TextAlign.center,
                        ),
                        flex: 1),
                    Flexible(child: Container(), flex: 1),
                  ],
                ),
                background: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    FadeInImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(restaurant.menu[index_cat].banner),
                      placeholder: AssetImage("assets/placeholders/img5.jpg"),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Colors.black, Colors.transparent]),
                          backgroundBlendMode: BlendMode.darken),
                    )
                  ],
                ),
              )),
          getFood(context, restaurant.menu[index_cat].food,
              MediaQuery.of(context).size.height, false)
        ],
      ),
    );
  }

  SliverList getFood(
      context, List<Food> food, double headerHeight, bool isOpen) {
    double height = MediaQuery.of(context).size.height;
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return Container(
          //height: MediaQuery.of(context).size.height - headerHeight - 5 / 6,
          decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
              width: .2,
              color: Colors.grey,
            )),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      food[index].nameFood,
                      style: CustomStyle.foodNameStyle(),
                    ),
                    Text(
                      'DZD ${food[index].price}',
                      style: CustomStyle.priceStyle(),
                    )
                  ],
                ),
                InkWell(
                  onTap: () {
                    if (!isOpen)
                      Scaffold.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.red[900],
                        content: Text("Restaurant is closed"),
                        duration: Duration(seconds: 1),
                      ));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        border: Border.all(
                            color: CustomStyle.selectedTabColor, width: .5)),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text(
                        "ADD TO CART",
                        style: CustomStyle.addToCartStyle(),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }, childCount: food.length),
    );
  }
}
