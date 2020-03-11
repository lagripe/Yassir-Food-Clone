import 'package:flutter/material.dart';
import 'package:yassir_food_prototype/config/style.dart';
import 'package:yassir_food_prototype/staticData.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController _first, _last, _email, _phone;
  @override
  void initState() {
    super.initState();
    _first = TextEditingController(text: StaticData.firstName);
    _last = TextEditingController(text: StaticData.lastName);
    _email = TextEditingController(text: StaticData.email);
    _phone = TextEditingController(text: '+213 ${StaticData.phone}');
  }

  @override
  void dispose() {
    super.dispose();
    _first.dispose();
    _last.dispose();
    _email.dispose();
    _phone.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.arrow_back_ios, size: 20,color: Colors.black,)),
        titleSpacing: 15,
        title: Text(
          "Edit profile",
          style: CustomStyle.appBarStyle(),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: SingleChildScrollView(
            child: Padding(
            padding: const EdgeInsets.all(40),
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height - 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
//---------------- First Name ----------------
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                        Text("FIRST NAME",style: CustomStyle.headerEdit(),),
                        TextField(
                          style: CustomStyle.textFieldTextStyle(),
                          controller: _first,decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(width: .5,color: Colors.grey[500])),
                            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(width: .5,color: Colors.grey[500])),
                          suffixStyle: CustomStyle.textFieldTextStyle())),
                      ],),
                      SizedBox(height: 10,),
//---------------- Last Name ----------------
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                        Text("LAST NAME",style: CustomStyle.headerEdit(),),
                        TextField(
                          style: CustomStyle.textFieldTextStyle(),
                          controller: _last,decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(width: .5,color: Colors.grey[500])),
                            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(width: .5,color: Colors.grey[500])),
                          suffixStyle: CustomStyle.textFieldTextStyle())),
                      ],),
                      SizedBox(height: 10,),
//---------------- email ----------------
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                        Text("EMAIL",style: CustomStyle.headerEdit(),),
                        TextField(
                          style: CustomStyle.textFieldTextStyle(),
                          controller: _email,decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(width: .5,color: Colors.grey[500])),
                            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(width: .5,color: Colors.grey[500])),
                          suffixStyle: CustomStyle.textFieldTextStyle())),
                      ],),
                      SizedBox(height: 10,),
//---------------- phone ----------------
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                        Text("PHONE NUMBER",style: CustomStyle.headerEdit(),),
                        TextField(
                          enabled: false,
                          style: CustomStyle.textFieldTextStyle(),
                          controller: _phone,decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(width: .5,color: Colors.grey[500])),
                            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(width: .5,color: Colors.grey[500])),
                            
                          suffixStyle: CustomStyle.textFieldTextStyle())),
                        
                      ],),
                      
                    ],
                  ),
                  Expanded(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Container(
                              height: 60,
                              color: Colors.red[700],
                              width: double.infinity,
                              child: Center(
                                child: Text(
                                  "UPDATE",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontFamily: "Sofia",
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                          )
                        ]),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
