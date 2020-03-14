import 'package:flutter/material.dart';
import 'package:yassir_food_prototype/pages/SplashScreen.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
      (_) => runApp(MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              accentColor: Colors.red[900],
              appBarTheme: AppBarTheme(color: Color(0xfffcfbfc), elevation: 2)),
          home: SplashScreen())));
}
