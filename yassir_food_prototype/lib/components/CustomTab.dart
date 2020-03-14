import 'package:flutter/material.dart';
import 'package:yassir_food_prototype/config/style.dart';
import 'package:yassir_food_prototype/staticData.dart';

class CustomTab extends StatefulWidget {
  String title;
  String icon;
  CustomTab({@required this.title, @required this.icon});
  @override
  _CustomTabState createState() => _CustomTabState(title: title, icon: icon);
}

class _CustomTabState extends State<CustomTab> {
  String title;
  String icon;
  _CustomTabState({@required this.title, @required this.icon});
  refresh() => setState(() {});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 4,
      height: 56,
      child:
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Stack(children: [
              ImageIcon(
                AssetImage(icon),
                size: 25,
                //color: CustomStyle.tabColor,
              ),
              title == "Cart" && StaticData.cart.orders.length != 0
                  ? Positioned(
                      right: 0,
                      top: 0,
                      child: CircleAvatar(
                        backgroundColor: CustomStyle.selectedTabColor,
                        radius: 5,
                        child: Text(
                          "",
                          style: TextStyle(fontFamily: "Sofia", fontSize: 12),
                        ),
                      ))
                  : Container()
            ]),
            Text(
              title,
              style: CustomStyle.tabStyle(),
            ),
          ],
        ),
      ]),
    );
  }
}
