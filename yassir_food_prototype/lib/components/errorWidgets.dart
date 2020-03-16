import 'package:flutter/material.dart';
import 'package:yassir_food_prototype/config/style.dart';

class ErrorWidgets {
  static Widget error(
      {BuildContext context,
      String header,
      String subHeader,
      String asset,
      String searchKeyword = ""}) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Container(
        height: size.height,
        width: size.width,
        color: CustomStyle.scaffoldBackgroundColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
              searchKeyword.length > 2
                  ? Text(
                      '"$searchKeyword"',
                      style: CustomStyle.contentBlackStyle(),
                    )
                  : Container(),
              SizedBox(
                height: 10,
              ),
              Text(
                subHeader,
                style: CustomStyle.contentStyle(),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }

  static noImplementation() => Scaffold(
        body: Container(
          child: Center(
            child: Text("Not implemented yet!"),
          ),
        ),
      );
}
