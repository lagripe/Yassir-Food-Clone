import 'package:flutter/material.dart';
import 'package:yassir_food_prototype/components/CustomAppBars.dart';
import 'package:yassir_food_prototype/components/CustomTab.dart';
import 'package:yassir_food_prototype/config/style.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  int _currentIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
              ? CustomAppBars.exploreAppBar()
              : _currentIndex == 2
                  ? CustomAppBars.simpleAppBar("Cart")
                  : CustomAppBars.simpleAppBar("My account"),
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: _tabController, children: [
        Container(
          color: CustomStyle.scaffoldBackgroundColor,
        ),
        Container(
          color: CustomStyle.scaffoldBackgroundColor,
        ),
        Container(
          color: CustomStyle.scaffoldBackgroundColor,
        ),
        Container(
          color: CustomStyle.scaffoldBackgroundColor,
        ),
      ]),
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
