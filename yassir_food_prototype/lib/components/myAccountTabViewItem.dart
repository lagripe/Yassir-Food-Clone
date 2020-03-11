import 'package:flutter/material.dart';
import 'package:yassir_food_prototype/config/classes.dart';
import 'package:yassir_food_prototype/config/manager.dart';
import 'package:yassir_food_prototype/config/style.dart';
import 'package:store_redirect/store_redirect.dart';
import 'package:yassir_food_prototype/pages/EditProfilePage.dart';
import 'package:yassir_food_prototype/pages/ManageAddresses.dart';
import '../staticData.dart';
import 'errorWidgets.dart';

class MyAccountTabViewItem extends StatelessWidget {
  static final List<MyAccountItem> items = [
    MyAccountItem(
        iconPath: "profile.png",
        header: "Edit profile",
        clickable: Icon(
          Icons.arrow_forward_ios,
          size: 15,
        ),
        replacement: null,
        colored: false,
        callback: EditProfilePage()),
    MyAccountItem(
        iconPath: "location.png",
        header: "Manage addresses",
        clickable: Icon(
          Icons.arrow_forward_ios,
          size: 15,
        ),
        replacement: null,
        colored: false,
        callback: ManageAddressesPage()),
    MyAccountItem(
        iconPath: "cart.png",
        header: "Orders",
        clickable: Icon(
          Icons.arrow_forward_ios,
          size: 15,
        ),
        replacement: null,
        colored: false,
        callback: ErrorWidgets.noImplementation()),
    MyAccountItem(
        iconPath: null,
        header: "Favorites",
        clickable: Icon(
          Icons.arrow_forward_ios,
          size: 15,
        ),
        replacement: Icons.favorite_border,
        colored: false,
        callback:ErrorWidgets.noImplementation()),
    MyAccountItem(
        iconPath: "logo_yassir_small.png",
        header: "YASSIR",
        clickable: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            color: Colors.grey[300],
            child: Padding(
              padding: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
              child: Text(
                "Open",
                style: TextStyle(
                    color: Colors.grey[800], fontFamily: "Sofia", fontSize: 12),
              ),
            ),
          ),
        ),
        replacement: null,
        colored: true,
        callback: ErrorWidgets.noImplementation()),
    MyAccountItem(
        iconPath: "logout.png",
        header: "Logout",
        clickable: Icon(
          Icons.arrow_forward_ios,
          size: 15,
        ),
        replacement: null,
        colored: false,
        callback: ErrorWidgets.noImplementation()),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: List.generate(items.length, (index) {
            return Padding(
                padding: const EdgeInsets.only(bottom: 0, top: 0),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () => items[index].colored
                          ? StoreRedirect.redirect(
                              androidAppId: StaticData.appId)
                          : Manager.customPageRoute(context, items[index].callback, Offset(1,0), Offset.zero, Duration(milliseconds: 400)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            //mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                width: 25,
                                height: 25,
                                child: items[index].iconPath == null
                                    ? Icon(items[index].replacement,
                                        size: 25)
                                    : items[index].colored
                                        ? Image(
                                            image: AssetImage(
                                                "assets/img/${items[index].iconPath}"),
                                            fit: BoxFit.fill,
                                          )
                                        : Image(
                                            image: AssetImage(
                                                "assets/img/${items[index].iconPath}"),
                                            fit: BoxFit.fill,
                                            color: Colors.black,
                                          ),
                              ),
                              SizedBox(
                                width: 25,
                              ),
                              Text(
                                items[index].header,
                                style: CustomStyle.accountItemStyle(),
                              )
                            ],
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                items[index].clickable
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      color: Colors.grey,
                    )
                  ],
                ));
          }),
        ),
      ),
    );
  }
}
