import 'package:flutter/material.dart';
import 'package:yassir_food_prototype/config/style.dart';

class ManageAddressesPage extends StatefulWidget {
  @override
  _ManageAddressesPageState createState() => _ManageAddressesPageState();
}

class _ManageAddressesPageState extends State<ManageAddressesPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.arrow_back_ios, size: 20,color: Colors.black,)),
        titleSpacing: 15,
        title: Text(
          "Manage Addresses",
          style: CustomStyle.appBarStyle(),
        ),
      ),);
  }
}
