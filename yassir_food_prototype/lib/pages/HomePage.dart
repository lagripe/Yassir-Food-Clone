import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yassir_food_prototype/components/CartTabViewItem.dart';
import 'package:yassir_food_prototype/components/CustomAppBars.dart';
import 'package:yassir_food_prototype/components/CustomTab.dart';
import 'package:yassir_food_prototype/components/myAccountTabViewItem.dart';
import 'package:yassir_food_prototype/config/style.dart';
import 'package:yassir_food_prototype/components/MaklaTabViewItem.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';

import '../staticData.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  TextEditingController _controller;
  int _currentIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TextEditingController();
    _tabController = TabController(length: 4, initialIndex: 0, vsync: this);
    _tabController.addListener(
        () => setState(() => _currentIndex = _tabController.index));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _currentIndex == 0
          ? CustomAppBars.maklaAppBar("header", "location")
          : _currentIndex == 1
              ? CustomAppBars.exploreAppBar(_controller)
              : _currentIndex == 2
                  ? CustomAppBars.simpleAppBar("Cart")
                  : CustomAppBars.simpleAppBar("My account"),
      body: WillPopScope(
        onWillPop: (){return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Confirm Exit"),
            content: Text("Are you sure you want to exit?"),
            actions: <Widget>[
              FlatButton(
                child: Text("YES"),
                onPressed: () {
                  SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                },
              ),
              FlatButton(
                child: Text("NO"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
            )
          ],
        );
      }
    );},
        child: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            controller: _tabController,
            children: [
              MaklaTabViewItem(
                restaurants: StaticData.restaurants,
                location: "",
              ),
              Container(
                color: CustomStyle.scaffoldBackgroundColor,
                child: Center(
                  child: Text(
                    "Search for restaurants or dishes.",
                    style: CustomStyle.restaurantAdrs(),
                  ),
                ),
              ),
              CartTabViewItem(),
              MyAccountTabViewItem()
            ]),
      ),
      bottomNavigationBar: TabBar(
          unselectedLabelColor: CustomStyle.unselectedTabColor,
          labelColor: CustomStyle.selectedTabColor,
          indicatorColor: Colors.transparent,
          controller: _tabController,
          tabs: [
            CustomTab(
              title: "MAKLA",
              icon: "assets/img/makla.png",
            ),
            CustomTab(
              title: "Explore",
              icon: "assets/img/explore.png",
            ),
            CustomTab(
              title: "Cart",
              icon: "assets/img/cart.png",
            ),
            CustomTab(
              title: "Account",
              icon: "assets/img/account.png",
            ),
          ]),
    );
  }
}
