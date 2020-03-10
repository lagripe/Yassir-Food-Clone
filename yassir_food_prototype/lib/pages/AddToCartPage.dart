import 'package:flutter/material.dart';
import 'package:yassir_food_prototype/config/classes.dart';
import 'package:yassir_food_prototype/config/style.dart';

class AddToCartPage extends StatefulWidget {
  String idRes, idCat;
  Food food;
  AddToCartPage(
      {@required this.idRes, @required this.idCat, @required this.food});
  @override
  _AddToCartPageState createState() =>
      _AddToCartPageState(idRes: idRes, idCat: idCat, food: food);
}

class _AddToCartPageState extends State<AddToCartPage> {
  String idRes, idCat;
  Food food;
  int quatity = 1;
  final int maxQuantity = 99;
  TextEditingController _editController;
  _AddToCartPageState(
      {@required this.idRes, @required this.idCat, @required this.food});
  _qChange(bool inc) => inc
      ? setState(() => maxQuantity - quatity < 0 ? null : quatity++)
      : setState(() => quatity > 1 ? quatity-- : null);
  @override
  void initState() {
    super.initState();
    _editController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _editController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add item",
          style: TextStyle(color: Colors.black, fontFamily: "Sofia"),
        ),
        centerTitle: true,
        leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.arrow_back_ios, color: Colors.black, size: 25)),
      ),
      body: GestureDetector(
        onTap: ()=> FocusScope.of(context).requestFocus(FocusNode()),
              child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Container(
              height: MediaQuery.of(context).size.height * 5.9/7,
              child: Column(
                children: <Widget>[
//------------ Food Name
                  Flexible(
                    fit: FlexFit.loose,
                    flex: 2,
                    child: Center(
                      child: Text(
                        food.nameFood,
                        style: CustomStyle.foodNameAddCartStyle(),
                      ),
                    ),
                  ),
//------------ TextField
                  Flexible(
                    fit: FlexFit.loose,
                    flex: 5,
                    child: Column(
                      children: <Widget>[
                        Container(
                          color: CustomStyle.scaffoldBackgroundColor,
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Row(
                              children: <Widget>[
                                ImageIcon(
                                  AssetImage("assets/img/edit.png"),
                                  size: 15,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: Text(
                                    "Special instruction",
                                    style: TextStyle(
                                        fontFamily: "Sofia", color: Colors.black),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: TextField(
                              keyboardType: TextInputType.multiline,
                              maxLines: 10,
                              controller: _editController,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: CustomStyle.scaffoldBackgroundColor,
                                  hintText:
                                      "Add a note (extra sauce, no sauce...etc)",
                                  hintStyle: TextStyle(
                                      fontFamily: "Sofia",
                                      fontSize: 14,
                                      color: Colors.grey),
                                  border: InputBorder.none),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
//------------ Quantity ----------
                  Flexible(
                      flex: 1,
                      fit: FlexFit.loose,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(10)),
                            height: 50,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(left: 25),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      InkWell(
                                        onTap: () => _qChange(false),
                                        child: Text(
                                          "-",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: "Sofia",
                                              fontSize: 30,
                                              fontWeight: FontWeight.w800),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      CircleAvatar(
                                        radius: 13,
                                        backgroundColor: Colors.white,
                                        child: Text(
                                          quatity.toString(),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: "Sofia"),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      InkWell(
                                        onTap: () => _qChange(true),
                                        child: Text(
                                          "+",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: "Sofia",
                                              fontSize: 30,
                                              fontWeight: FontWeight.w800),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        Text(
                                          "ADD TO CART",
                                          style: TextStyle(
                                              fontFamily: "Sofia",
                                              color: Colors.white),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
