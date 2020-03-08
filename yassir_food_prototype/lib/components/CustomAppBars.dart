import 'package:flutter/material.dart';
import 'package:yassir_food_prototype/config/style.dart';

class CustomAppBars {
  static AppBar maklaAppBar(String header, String location) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Getting Location...",
                style: TextStyle(
                    color: Colors.black, fontFamily: "Sofia", fontSize: 15)),
            Text("El Biar, Algeria",
                style: TextStyle(
                    color: Colors.grey,
                    fontFamily: "Sofia",
                    fontSize: 12,
                    fontWeight: FontWeight.w600)),
          ],
        ),
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Container(
                color: CustomStyle.scaffoldBackgroundColor,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Categories",
                        style:
                            TextStyle(color: Colors.black, fontFamily: "Sofia"),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      ImageIcon(
                        AssetImage("assets/img/filter.png"),
                        color: Colors.black,
                      )
                    ],
                  ),
                )),
          ),
        ),
      ],
    );
  }

  static AppBar exploreAppBar(TextEditingController controller) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: TextField(
        controller: controller,
        decoration: InputDecoration(
            hintText: "Search for restaurantsn, dishes...",
            hintStyle: TextStyle(
                color: Colors.grey, fontFamily: "Sofia", fontSize: 14),
            prefixIcon: Icon(
              Icons.search,
              //AssetImage("assets/img/explore.png"),
              size: 27,
              color: Colors.black,
            ),
            border: InputBorder.none),
      ),
    );
  }

  static AppBar simpleAppBar(String title) => AppBar(
        automaticallyImplyLeading: false,
        title: Text(title, style: CustomStyle.appBarStyle()),
        centerTitle: true,
        backgroundColor: CustomStyle.splashBackgroundColor,
      );
}
