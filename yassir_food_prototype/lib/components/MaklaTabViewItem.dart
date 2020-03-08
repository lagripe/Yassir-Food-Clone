import 'package:flutter/material.dart';
import 'package:yassir_food_prototype/config/classes.dart';
import 'package:yassir_food_prototype/config/manager.dart';
import 'package:yassir_food_prototype/config/style.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:yassir_food_prototype/pages/RestaurantPage.dart';

class MaklaTabViewItem extends StatefulWidget {
  String location;
  List<Restaurant> restaurants;
  MaklaTabViewItem({@required this.restaurants, @required this.location});
  @override
  _MaklaTabViewItemState createState() =>
      _MaklaTabViewItemState(restaurants: restaurants, location: location);
  
}

class _MaklaTabViewItemState extends State<MaklaTabViewItem> {
  String location;
  List<Restaurant> restaurants;
  _MaklaTabViewItemState({@required this.restaurants, @required this.location});
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: CustomStyle.scaffoldBackgroundColor,
      child: FutureBuilder(
        future: Manager.getRestaurantByLocation(restaurants, location),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print("Building List ");
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  int r = index % 18;
                  return InkWell(
                    onTap: () => Manager.customPageRoute(
                        context,
                        RestaurantPage(restaurant: snapshot.data[index]),
                        Offset(1.0, 0.0),
                        Offset.zero,
                        Duration(milliseconds: 400)),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 10, right: 10, left: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          height: 210,
                          child: Stack(
                            fit: StackFit.expand,
                            children: <Widget>[
                              FadeInImage(
                                placeholder: AssetImage(
                                    "assets/img/placeholders/img$r.jpg"),
                                image:
                                    NetworkImage(snapshot.data[index].banner),
                                fit: BoxFit.fill,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Opacity(
                                    opacity: 0.35,
                                    child: Container(
                                      height: 75,
                                      color: Color(0xff292c30),
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Container(
                                    height: 75,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 20.0, left: 5),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  snapshot.data[index]
                                                      .nameRestaurant,
                                                  style: CustomStyle
                                                      .cardStyleLeft(),
                                                ),
                                                Row(
                                                  children: <Widget>[
                                                    SmoothStarRating(
                                                        allowHalfRating: false,
                                                        starCount: 5,
                                                        rating: snapshot
                                                            .data[index].rating,
                                                        size: 20.0,
                                                        filledIconData:
                                                            Icons.star,
                                                        halfFilledIconData:
                                                            Icons.star_half,
                                                        color:
                                                            Colors.yellow[700],
                                                        borderColor:
                                                            Colors.yellow[700],
                                                        spacing: 1.0),
                                                    Text(
                                                      snapshot
                                                          .data[index].rating
                                                          .toString(),
                                                      style: CustomStyle
                                                          .cardStyleRight(),
                                                    )
                                                  ],
                                                )
                                                /*
                                                getRate(
                                                    snapshot.data[index].rating)
                                                Text("Rate",
                                                    style: CustomStyle
                                                        .cardStyleRight())*/
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              top: 10.0,
                                            ),
                                            child: Column(
                                              children: <Widget>[
                                                Text(
                                                  "45-55 Mins",
                                                  style: CustomStyle
                                                      .cardStyleRight(),
                                                ),
                                                SizedBox(
                                                  height: 7,
                                                ),
                                                ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    child: Container(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 15,
                                                                vertical: 5),
                                                        child: Text(
                                                            snapshot.data[index]
                                                                    .isOpen
                                                                ? "OPEN"
                                                                : "CLOSED",
                                                            style: CustomStyle
                                                                .cardStyleRight()),
                                                      ),
                                                      color: snapshot
                                                              .data[index]
                                                              .isOpen
                                                          ? Color(0xFF24B42E)
                                                          : CustomStyle
                                                              .selectedTabColor,
                                                    ))
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                });
          } else {
            return noRestaurants(context);
          }
        },
      ),
    );
  }

  Widget noRestaurants(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: CustomStyle.scaffoldBackgroundColor,
      child: Column(
        children: <Widget>[
          Flexible(
            child: Container(),
            flex: 1,
          ),
          Flexible(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image(
                    image: AssetImage("assets/img/shop.png"),
                    width: size.width / 2.5,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "No restaurants available",
                    style: CustomStyle.contentRedStyle(),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "No restaurants available in your location, please \n check with some other locations",
                    style: CustomStyle.contentStyle(),
                    textAlign: TextAlign.center,
                  )
                ],
              )),
        ],
      ),
    );
  }

  Widget getRate(double rate) {
    int count = rate.floor();
    bool delta = rate - count < 0.5;
    return Row(
      children: List.generate(count + 2, (index) {
        if (index < count) {
          return ImageIcon(
            AssetImage("assets/img/star.png"),
            size: 20,
            color: Colors.yellow[700],
          );
        } else {
          if (index == count) {
            if (delta)
              return Container();
            else
              return ImageIcon(
                AssetImage("assets/img/half-star.png"),
                size: 20,
                color: Colors.yellow[700],
              );
          } else {
            return Text(
              rate.toString(),
              style: CustomStyle.cardStyleRight(),
            );
          }
        }
      }),
    );
  }
}
