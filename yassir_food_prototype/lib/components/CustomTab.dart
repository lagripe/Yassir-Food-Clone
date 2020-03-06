import 'package:flutter/material.dart';
import 'package:yassir_food_prototype/config/style.dart';

class CustomTab extends StatelessWidget {
  String title;
  String icon;
  CustomTab({@required this.title, @required this.icon});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ImageIcon(
            AssetImage(icon),
            size: 25,
            //color: CustomStyle.tabColor,
          ),
          Text(
            title,
            style: CustomStyle.tabStyle(),
          ),
        ],
      ),
    );
  }
}
