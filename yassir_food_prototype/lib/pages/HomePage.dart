import 'package:flutter/material.dart';
import 'package:yassir_food_prototype/components/CustomTab.dart';
import 'package:yassir_food_prototype/config/style.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 4, initialIndex: 0, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffcfbfc),
      body: TabBarView(controller: _tabController, children: [
        Scaffold(appBar: AppBar(title: Text("Cart"),),),
        Text("data"),
        Text("data"),
        Text("data"),
      ]),
      bottomNavigationBar: TabBar(
        unselectedLabelColor: CustomStyle.unselectedTabColor,
        labelColor: CustomStyle.selectedTabColor,
        indicatorColor: Colors.transparent,
        controller: _tabController, 
      tabs: [
        Tab(
          child: CustomTab(
            title: "MAKLA",
            icon: "assets/img/makla.png",
          ),
        ),
        Tab(
          child: CustomTab(
            title: "Explore",
            icon: "assets/img/explore.png",
          ),
        ),
        Tab(
          child: CustomTab(
            title: "Cart",
            icon: "assets/img/cart.png",
          ),
        ),
        Tab(
          child: CustomTab(
            title: "Account",
            icon: "assets/img/account.png",
          ),
        ),
      ]),
    );
  }
}
