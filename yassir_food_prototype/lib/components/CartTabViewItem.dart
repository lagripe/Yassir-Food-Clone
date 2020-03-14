import 'package:flutter/material.dart';
import 'package:yassir_food_prototype/components/Separator.dart';
import 'package:yassir_food_prototype/config/classes.dart';
import 'package:yassir_food_prototype/config/manager.dart';
import 'package:yassir_food_prototype/config/style.dart';
import 'package:yassir_food_prototype/pages/RestaurantPage.dart';
import 'package:yassir_food_prototype/staticData.dart';

import 'errorWidgets.dart';

class CartTabViewItem extends StatefulWidget {
  @override
  _CartTabViewItemState createState() => _CartTabViewItemState();
}

class _CartTabViewItemState extends State<CartTabViewItem> {
  @override
  Widget build(BuildContext context) {
    return StaticData.cart.orders.length == 0
        ? ErrorWidgets.error(
            context: context,
            header: "Your cart is empty",
            subHeader: "Your cart is empty. Kindly add something from menu",
            asset: "burger")
        : SingleChildScrollView(
            child: Column(
              children: <Widget>[
//-------- Restaurant Info ------------
                Container(
                  color: CustomStyle.scaffoldBackgroundColor,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: FadeInImage(
                            placeholder:
                                AssetImage("assets/placeholders/img0.jpg"),
                            image:
                                NetworkImage(StaticData.cart.restaurant.banner),
                            width: 65,
                            height: 60,
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(
                          width: 23,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: 8,
                            ),
                            Text(StaticData.cart.restaurant.nameRestaurant,
                                style: TextStyle(
                                    fontFamily: "Sofia",
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700)),
                            SizedBox(
                              height: 5,
                            ),
                            Text(StaticData.cart.restaurant.delivers_in,
                                style: TextStyle(
                                    fontFamily: "Sofia",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.grey))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
//-------- Orders ------------
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: getOrders(),
                    ),
                  ),
                ),
//-------- Fees ------------
                Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: <Widget>[
                          InkWell(
                            onTap: () => Manager.customPageRoute(
                                context,
                                RestaurantPage(
                                    restaurant: StaticData.cart.restaurant),
                                Offset(0, 1),
                                Offset.zero,
                                Duration(milliseconds: 350)),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: Colors.grey[400]),
                                  color: CustomStyle.scaffoldBackgroundColor),
                              height: 50,
                              child: Center(
                                child: Text("ADD OTHER FOOD",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "Sofia",
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600)),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Separator(color: CustomStyle.scaffoldBackgroundColor),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text(
                                    "Estimated Subtotal",
                                    style: TextStyle(
                                        color: Colors.grey[500],
                                        fontFamily: "Sofia",
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                      StaticData.cart.restaurant.nameRestaurant,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Sofia",
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400)),
                                ],
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Text(
                                        StaticData.orders
                                            .map((order) =>
                                                order.quantity *
                                                order.food.price)
                                            .toList()
                                            .reduce((curr, next) => curr + next)
                                            .toString(),
                                        style: TextStyle(
                                            color: Colors.grey[350],
                                            fontFamily: "Sofia",
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500))
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Separator(color: CustomStyle.scaffoldBackgroundColor),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text("Coupon discount",
                                  style: TextStyle(
                                      fontFamily: "Sofia",
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey)),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Container(
                                  height: 25,
                                  width: 60,
                                  color: Colors.red[50],
                                  child: Center(
                                    child: Text("APPLY",
                                        style: TextStyle(
                                            fontFamily: "Sofia",
                                            fontSize: 10,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.red)),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text("Delivery charges",
                                  style: TextStyle(
                                      fontFamily: "Sofia",
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey)),
                              Text("0.00",
                                  style: TextStyle(
                                      color: Colors.grey[350],
                                      fontFamily: "Sofia",
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400))
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text("SubTotal",
                                  style: TextStyle(
                                      fontFamily: "Sofia",
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey)),
                              Text(
                                  StaticData.orders
                                      .map((order) =>
                                          order.quantity * order.food.price)
                                      .toList()
                                      .reduce((curr, next) => curr + next)
                                      .toStringAsFixed(2),
                                  style: TextStyle(
                                      color: Colors.grey[350],
                                      fontFamily: "Sofia",
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500))
                            ],
                          ),
                          Divider(
                            color: Colors.grey[350],
                            thickness: 1,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text("Total to pay",
                                  style: TextStyle(
                                      fontFamily: "Sofia",
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black)),
                              SizedBox(
                                width: 50,
                              ),
                              Text(
                                  StaticData.orders
                                      .map((order) =>
                                          order.quantity * order.food.price)
                                      .toList()
                                      .reduce((curr, next) => curr + next)
                                      .toStringAsFixed(2),
                                  style: TextStyle(
                                      color: Colors.red[600],
                                      fontFamily: "Sofia",
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700))
                            ],
                          ),
                        ],
                      ),
                    )),
                SizedBox(height: 15),
//-------- ADDRESS ------------
                Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Text("Saved address",
                            style: TextStyle(
                                fontFamily: "Sofia",
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Colors.black)),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: double.infinity,
                          height: 70,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              border: Border.all(
                                  color: Colors.grey[400], width: 2)),
                          child: Center(
                            child: Text("No Address",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Sofia",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  color: Colors.white,
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.red[800],
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: Text(
                          "PROCEED",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Sofia",
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
  }

  _qChange(bool inc, int index) => inc
      ? setState(() => StaticData.cart.orders[index].quantity < 98
          ? StaticData.cart.orders[index].quantity++
          : null)
      : setState(() => StaticData.cart.orders[index].quantity > 1
          ? StaticData.cart.orders[index].quantity--
          : null);
  _removeOrder(int index) =>
      setState(() => StaticData.cart.orders.removeAt(index));
  getOrders() => List.generate(StaticData.cart.orders.length, (index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: InkWell(
            onLongPress: () => showDialog(
                context: context,
                barrierDismissible: true,
                builder: (context) {
                  return AlertDialog(
                    elevation: 5,
                    title: Text("Deleting"),
                    content: Text(
                      "Are you sure you want to dismiss the selected portion?",
                      style: TextStyle(fontFamily: "Sofia"),
                    ),
                    actions: <Widget>[
                      FlatButton(
                        color: Colors.black,
                        child: Text("YES"),
                        onPressed: () {
                          _removeOrder(index);
                          Navigator.of(context).pop();
                        },
                      ),
                      FlatButton(
                          color: Colors.red[900],
                          child: Text("NO"),
                          onPressed: () => Navigator.of(context).pop()),
                    ],
                  );
                }),
            child: Row(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      StaticData.cart.orders[index].food.nameFood,
                      style: CustomStyle.foodNameStyle(),
                    ),
                    Text(
                      '${(StaticData.cart.orders[index].food.price * StaticData.cart.orders[index].quantity).toStringAsFixed(2)}',
                      style: CustomStyle.priceStyle(),
                    )
                  ],
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      InkWell(
                        onTap: () => _qChange(false, index),
                        child: Container(
                          width: 35,
                          height: 25,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              border: Border.all(color: Colors.grey[350])),
                          child: Center(
                              child: Text(
                            "-",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Sofia",
                                fontSize: 18),
                          )),
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(StaticData.cart.orders[index].quantity.toString(),
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Sofia",
                              fontSize: 16)),
                      SizedBox(width: 10),
                      InkWell(
                        onTap: () => _qChange(true, index),
                        child: Container(
                          width: 35,
                          height: 25,
                          decoration: BoxDecoration(
                              color: Colors.red[700],
                              borderRadius: BorderRadius.circular(2),
                              border: Border.all(color: Colors.red[700])),
                          child: Center(
                              child: Text(
                            "+",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Sofia",
                                fontSize: 18),
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      });
}
