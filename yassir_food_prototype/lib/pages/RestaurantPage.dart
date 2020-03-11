import 'package:flutter/material.dart';
import 'package:yassir_food_prototype/config/classes.dart';
import 'package:yassir_food_prototype/config/manager.dart';
import 'package:yassir_food_prototype/config/style.dart';
import 'package:yassir_food_prototype/pages/RestaurantCategory.dart';

class RestaurantPage extends StatefulWidget {
  Restaurant restaurant;
  RestaurantPage({@required this.restaurant});
  @override
  _RestaurantPageState createState() =>
      _RestaurantPageState(restaurant: restaurant);
}

class _RestaurantPageState extends State<RestaurantPage> {
  Restaurant restaurant;
  _RestaurantPageState({@required this.restaurant});
  @override
  Widget build(BuildContext context) {
    double headerHeight = MediaQuery.of(context).size.height * 2.15 / 5;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              color: Color(0xfff4f5f6),
              height: headerHeight,
              child: Stack(
                children: <Widget>[
                  //------- Image ----------
                  Container(
                    height: headerHeight * 3.65 / 5,
                    width: double.infinity,
                    child: ShaderMask(
                        shaderCallback: (rect) {
                          return LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.black, Colors.transparent],
                          ).createShader(Rect.fromLTRB(
                              0, rect.height - 10, 0, rect.height));
                        },
                        blendMode: BlendMode.dst,
                        child: FadeInImage(
                          image: NetworkImage(restaurant.banner),
                          placeholder:
                              AssetImage("assets/img/placeholders/img0.jpg"),
                          fit: BoxFit.fill,
                        )),
                  ),
                  // --------- appBar -------------
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 45.0, right: 15, left: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                        Icon(
                          Icons.favorite_border,
                          size: 30,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  //-------- Restaurant Info ------
                  Positioned(
                    bottom: 5,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            border:
                                Border.all(width: .1, color: Colors.grey[400]),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 2,
                                  spreadRadius: .5,
                                  color: Colors.grey[300],
                                  offset: Offset(0, 2))
                            ]),
                        height:
                            (headerHeight - (headerHeight * 3.65 / 5)) * 1.75,
                        width: MediaQuery.of(context).size.width - 40,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Text(
                                  restaurant.nameRestaurant,
                                  style: CustomStyle.restaurantName(),
                                ),
                                Text(
                                  restaurant.adrs,
                                  style: CustomStyle.restaurantAdrs(),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Text(
                                      "OPEN TILL",
                                      style: CustomStyle.restaurantOptions(),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      restaurant.close_at,
                                      style: CustomStyle.restaurantAdrs(),
                                    )
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    Text(
                                      "DELIVERS IN",
                                      style: CustomStyle.restaurantOptions(),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      restaurant.delivers_in,
                                      style: CustomStyle.restaurantAdrs(),
                                    )
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    Text(
                                      "NOTE",
                                      style: CustomStyle.restaurantOptions(),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      restaurant.rating.toString(),
                                      style: CustomStyle.restaurantAdrs(),
                                    )
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            // MENU HERE
            getMENU(restaurant.menu, headerHeight, context)
          ],
        ),
      ),
    );
  }

  Widget getMENU(
      List<Category> menu, double headerHeight, BuildContext context) {
    double listHeight = MediaQuery.of(context).size.height - headerHeight - 5;

    return Container(
      height: MediaQuery.of(context).size.height - headerHeight - 5,
      child: ListView.builder(
          itemCount: menu.length,
          itemBuilder: (context, index) {
            int r = index % 18;
            print(index);
            return InkWell(
              onTap: () => Manager.customPageRoute(
                  context,
                  RestaurantCategory(restaurant: restaurant, index_cat: index),
                  Offset(0,1),
                  Offset.zero,
                  Duration(milliseconds: 400)),
              child: Container(
                //height: MediaQuery.of(context).size.height - headerHeight - 5 / 6,
                decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                    width: .2,
                    color: Colors.grey,
                  )),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 5.0, right: 5.0, top: 10, bottom: 10),
                  child: Row(
                    children: <Widget>[
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ClipOval(
                            //borderRadius: BorderRadius.circular(25),
                            child: FadeInImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(menu[index].banner),
                              placeholder: AssetImage(
                                  "assets/img/placeholders/img$r.jpg"),
                              width: 50,
                              height: 50,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              menu[index].nameCat,
                              style: CustomStyle.categoryNameStyle(),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 12,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
