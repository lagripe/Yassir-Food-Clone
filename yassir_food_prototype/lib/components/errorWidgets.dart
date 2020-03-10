import 'package:flutter/material.dart';
import 'package:yassir_food_prototype/config/style.dart';
class ErrorWidgets{
  static Widget empty_or_notFound(BuildContext context,String header,String subHeader,String asset) {
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
                    image: AssetImage("assets/img/$asset.png"),
                    width: size.width / 2.5,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    header,
                    style: CustomStyle.contentRedStyle(),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    subHeader,
                    style: CustomStyle.contentStyle(),
                    textAlign: TextAlign.center,
                  )
                ],
              )),
        ],
      ),
    );
  }
}