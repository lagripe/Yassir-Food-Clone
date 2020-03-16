import 'package:flutter/material.dart';
import 'package:yassir_food_prototype/staticData.dart';

class FilterPage extends StatefulWidget {
  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  @override
  Widget build(BuildContext context) {
    StaticData.filters.forEach((k, v) {
      print('$k => $v');
    });
    return Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Colors.black,
            ),
          ),
          title: Text(
            "Filters",
            style: TextStyle(
                fontFamily: "Sofia",
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black),
          ),
          actions: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: InkWell(
                  onTap: () => setState(() => StaticData.initFilters()),
                  child: Text(
                    "Reset",
                    style: TextStyle(
                        fontFamily: "Sofia",
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.red[800]),
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height - 150,
              child: ListView.builder(
                  itemCount: StaticData.menu.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Column(
                        children: <Widget>[
                          InkWell(
                            hoverColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onTap: () => setState(() => StaticData.filters
                                .update(
                                    StaticData.menu[index].idCat,
                                    (_) => !StaticData.filters[
                                        StaticData.menu[index].idCat])),
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 15.0, left: 8, bottom: 15.0),
                                    child: Text(
                                      StaticData.menu[index].nameCat,
                                      style: TextStyle(
                                          fontFamily: "Sofia",
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: StaticData.filters[
                                                  StaticData.menu[index].idCat]
                                              ? Colors.red[800]
                                              : Colors.black),
                                    ),
                                  ),
                                  StaticData
                                          .filters[StaticData.menu[index].idCat]
                                      ? selectedFilterIcon()
                                      : CircleAvatar(
                                          radius: 12,
                                          backgroundColor: Colors.grey[200],
                                        )
                                ],
                              ),
                            ),
                          ),
                          Divider(
                            color: Colors.grey[350],
                          )
                        ],
                      ),
                    );
                  }),
            ),
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    color: Colors.black,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Text(
                            "APPLY",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ));
  }

  Widget selectedFilterIcon() => CircleAvatar(
      backgroundColor: Colors.red[800],
      radius: 12,
      child: ImageIcon(
        AssetImage("assets/img/select.png"),
        size: 17,
        color: Colors.white,
      ));
}
