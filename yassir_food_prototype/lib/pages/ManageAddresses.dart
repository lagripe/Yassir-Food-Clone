import 'package:flutter/material.dart';
import 'package:yassir_food_prototype/components/errorWidgets.dart';
import 'package:yassir_food_prototype/config/style.dart';
import 'package:yassir_food_prototype/staticData.dart';

class ManageAddressesPage extends StatefulWidget {
  @override
  _ManageAddressesPageState createState() => _ManageAddressesPageState();
}

class _ManageAddressesPageState extends State<ManageAddressesPage> {
  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          leading: InkWell(
              onTap: () => Navigator.pop(context),
              child: Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: Colors.black,
              )),
          titleSpacing: 15,
          title: Text(
            "Manage Addresses",
            style: CustomStyle.appBarStyle(),
          ),
        ),
        body: Stack(
          children: <Widget>[
            StaticData.addresses.length == 3
                ? ErrorWidgets.error(
                    context: context,
                    asset: "map",
                    header: "No address Available",
                    subHeader:
                        "No address available. Saved addresses helps you to checkout faster ",
                  )
                : Container(),
            Positioned(
              bottom: 15,
              left: widthScreen - (widthScreen - 25),
              child: Container(
                height: 50,
                width: widthScreen - 50,
                color: Colors.black,
                child: Center(
                  child: Text(
                    "ADD NEW ADDRESS",
                    style: TextStyle(color: Colors.white,
                    fontFamily: "Sofia",
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
